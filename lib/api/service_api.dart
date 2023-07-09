import 'dart:async';
import 'dart:convert';

import 'package:crm_sahel_telecom/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as provider;
import '../Models/credits.dart';
import '../Models/utilisateur.dart';
import '../views/home.dart';
import '../views/login.dart';
import '../widget/dialogue.dart';
import '../widget/route.dart';
import 'host.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  final supabase = Supabase.instance.client;
  var host = Host();

  bool isEmail(String email) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }

  connexion({String? email, String? password, var context}) async {
    try {
      if (!isEmail(email!)) {
        alertDialogue(context, content: "Entrez une e-mail valide");
        provider.Provider.of<AuthProvider>(context, listen: false)
            .changeValConnexionIsLoading(false);
      } else {
        var response = await supabase.auth
            .signInWithPassword(email: email, password: password!)
            .timeout(const Duration(seconds: 10), onTimeout: () {
          throw TimeoutException("Time out");
        });
        provider.Provider.of<AuthProvider>(context, listen: false)
            .changeValConnexionIsLoading(true);
        if (response.user != null) {
          List data = await getUserData(email: response.user!.email);
          if (data.isNotEmpty) {
            pushNewPageRemoveUntil(
                Home(
                    user: Utilisateur(
                        id: data[0]['id'].toString(),
                        nom: data[0]['nom'],
                        prenom: data[0]['prenom'],
                        email: data[0]['email'],
                        pseudo: data[0]['pseudo'],
                        statut: data[0]['statut'],
                        grade: data[0]['grade'])),
                context);
          }
        }
      }
    } on AuthException catch (e) {
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.message);
    } on TimeoutException catch (e) {
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.message);
    } catch (e) {
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.toString());
    }
  }

  getUserData({String? email}) async {
    return await supabase.from("utilisateur").select("*").eq('email', email);
  }

  forgetPass({String? email, var context}) async {
    try {
      if (isEmail(email!)) {
        provider.Provider.of<AuthProvider>(context, listen: false)
            .changeValConnexionIsLoading(true);
        await supabase.auth.resetPasswordForEmail(email).whenComplete(() {
          provider.Provider.of<AuthProvider>(context, listen: false)
              .changeValConnexionIsLoading(false);
          alertDialogue(context,
              content: "Un lien de vérification vous a été envoyer par email");
        }).timeout(const Duration(seconds: 10), onTimeout: () {
          throw TimeoutException("Time out");
        });
        provider.Provider.of<AuthProvider>(context, listen: false)
            .changeValConnexionIsLoading(true);
      } else {
        alertDialogue(context, content: "Entrez une e-mail valide");
        provider.Provider.of<AuthProvider>(context, listen: false)
            .changeValConnexionIsLoading(false);
      }
    } on AuthException catch (e) {
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.message);
    } on TimeoutException catch (e) {
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.message);
    } catch (e) {
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
    }
  }

  verifyOTP({String? token, email, OtpType? otpType, var context}) async {
    try {
      await supabase.auth
          .verifyOTP(email: email!, token: token!, type: otpType!)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Time out");
      });
      // pushNewPageRemoveUntil(const Home(), context);
    } on AuthException catch (e) {
      alertDialogue(context, content: e.message);
    } on TimeoutException catch (e) {
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.message);
    } catch (e) {
      alertDialogue(context, content: e.toString());
    }
  }

  deconnexion({var context}) async {
    try {
      await supabase.auth.signOut();
      pushNewPageRemoveUntil(const Login(), context);
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeValConnexionIsLoading(false);
    } on AuthException catch (e) {
      alertDialogue(context, content: e.message);
    } catch (e) {
      alertDialogue(context, content: e.toString());
    }
  }

  addUser(
      {BuildContext? context,
      Utilisateur? utilisateur,
      required String? emailAdmin}) async {
    try {
      provider.Provider.of<AuthProvider>(context!, listen: false)
          .initDataUtilisateur(email: emailAdmin);
      Navigator.pop(context);
      await supabase.auth
          .signUp(email: utilisateur!.email, password: utilisateur.email!)
          .whenComplete(() async {
        alertDialogue(context,
            content:
                "Compte utilisateur crée avec succès,\nUn message de confirmation à été envoyer à l'email ${utilisateur.email}");
        await supabase.from("utilisateur").insert({
          "nom": utilisateur.nom,
          "prenom": utilisateur.prenom,
          "email": utilisateur.email,
          "statut": utilisateur.statut,
          "pseudo": utilisateur.pseudo,
          "grade": utilisateur.grade
        });
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Time out");
      });
    } on AuthException catch (e) {
      provider.Provider.of<AuthProvider>(context!, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.message);
    } on TimeoutException catch (e) {
      provider.Provider.of<AuthProvider>(context!, listen: false)
          .changeValConnexionIsLoading(false);
      alertDialogue(context, content: e.message);
    } catch (e) {
      alertDialogue(context, content: e.toString());
    }
  }

  getUserList({required String? email}) async {
    return await supabase
        .from("utilisateur")
        .select("*")
        .neq("email", email)
        .order('id', ascending: true);
  }

  changeStatutUser({int? id, bool? statut, required var context}) async {
    return await supabase
        .from('utilisateur')
        .update({'statut': statut}).match({'id': id});
  }

  contacterAdmin({required String? email, BuildContext? context}) async {
    await supabase.from("utilisateur").insert({"email": email}).whenComplete(
        () => alertDialogue(context,
            content: "Votre e-mail a été soumit avec succès! "));
  }

  storeModelPrediction({required Credits credits, var contexte}) async {
    simpleDialogueCardSansTitle(
        barrierDismissible: true, context: contexte, msg: "Analyse en cours");
    try {
      var data = await http.post(host.baseUrl(endpoint: "models/"), body: {
        "interestRate": credits.interestRate,
        "loanTerm": credits.loanTerm,
        "age": credits.age,
        "loanAmount": credits.loanAmount,
        "sexe": credits.sexe,
        "revenu": credits.revenu,
        "loanNbr": credits.loanNbr,
        "logement": credits.logement,
        "npaCharge": credits.npaCharge,
        "activiteSecondaire": credits.activiteSecondaire,
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Time out");
      });
      var response = await jsonDecode(data.body);

      print(response);

      if (data.statusCode == 200) {
        Navigator.pop(contexte);
        var response = await jsonDecode(data.body);
        credits.predictioSet(response['prediction'][0].toString());
        print(credits);
        await supabase.from("utilisateur").insert(credits.toMap());
      }
    } on TimeoutException catch (e) {
      Navigator.pop(contexte);
      alertDialogue(contexte, content: e.message);
    } catch (e) {
      print(e);
      Navigator.pop(contexte);
      alertDialogue(contexte,
          content: "C'est très domage le serveur distant ne reponds pas");
    }
  }
}
