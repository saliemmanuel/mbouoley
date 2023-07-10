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
import '../widget/display_prediction.dart';
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
            if (!data[0]['statut']) {
              alertDialogue(context,
                  content: "Votre compte à été désactivé contacter un admin");
              provider.Provider.of<AuthProvider>(context!, listen: false)
                  .changeValConnexionIsLoading(false);
            } else {
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
          } else {
            alertDialogue(context,
                content:
                    "Votre compte à été supprimer vous \nn'avez plus le droit à être ici");
            provider.Provider.of<AuthProvider>(context!, listen: false)
                .changeValConnexionIsLoading(false);
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
      provider.Provider.of<AuthProvider>(context, listen: false)
          .changeHomeIndex(0);
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
      await supabase.auth
          .signUp(email: utilisateur!.email, password: utilisateur.email!)
          .then((v) async {
        await supabase.from("utilisateur").insert({
          "nom": utilisateur.nom,
          "prenom": utilisateur.prenom,
          "pseudo": utilisateur.pseudo,
          "statut": utilisateur.statut,
          "email": utilisateur.email,
          "grade": utilisateur.grade,
          "uidi": v.user!.id,
        }).whenComplete(() {
          Navigator.pop(context!);
          alertDialogue(context,
              content:
                  "Compte utilisateur crée avec succès,\nUn message de confirmation à été envoyer à l'email ${utilisateur.email}");
          provider.Provider.of<AuthProvider>(context, listen: false)
              .initDataUtilisateur(email: emailAdmin);
        });
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connexion perdu, réessayer plus tard");
      });
    } on AuthException catch (e) {
      alertDialogue(context, content: e.message);
    } on TimeoutException catch (e) {
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
    simpleDialogueCardSansTitle(
        barrierDismissible: true, context: context, msg: "Patientez svp...");
    return await supabase.from('utilisateur').update({'statut': statut}).match(
        {'id': id}).then((value) => Navigator.pop(context));
  }

  contacterAdmin({required String? email, BuildContext? context}) async {
    await supabase.from("utilisateur").insert({"email": email}).whenComplete(
        () => alertDialogue(context,
            content: "Votre e-mail a été soumit avec succès! "));
  }

  storeModelPrediction({required CreditsModels credits, var contexte}) async {
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
      if (data.statusCode == 200) {
        Navigator.pop(contexte);
        var response = await jsonDecode(data.body);
        credits.predictioSet(response['prediction'][0].toString());
        await supabase.from("credit").insert(credits.toMap()).then((value) {
          Navigator.pop(contexte);
          actionDialogue(
            context: contexte,
            child: DisplayPrediction(credits: credits),
          );
          provider.Provider.of<AuthProvider>(contexte, listen: false)
              .initDataCredit();
        });
      }
    } on TimeoutException catch (e) {
      Navigator.pop(contexte);
      alertDialogue(contexte, content: e.message);
    } catch (e) {
      Navigator.pop(contexte);
      alertDialogue(contexte,
          content: "C'est très domage le serveur distant ne reponds pas");
    }
  }

  updateModelPrediction(
      {required CreditsModels credits,
      var contexte,
      required String? id}) async {
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
      if (data.statusCode == 200) {
        Navigator.pop(contexte);
        var response = await jsonDecode(data.body);
        credits.predictioSet(response['prediction'][0].toString());
        print(credits);
        await supabase
            .from("credit")
            .update(credits.toMap())
            .eq("id", id)
            .then((value) {
          Navigator.pop(contexte);
          actionDialogue(
            context: contexte,
            child: DisplayPrediction(credits: credits),
          );
          provider.Provider.of<AuthProvider>(contexte, listen: false)
              .initDataCredit();
        });
      }
    } on TimeoutException catch (e) {
      Navigator.pop(contexte);
      alertDialogue(contexte, content: e.message);
    } catch (e) {
      Navigator.pop(contexte);
      alertDialogue(contexte,
          content: "$e C'est très domage le serveur distant ne reponds pas");
    }
  }

  getCreditList() async {
    return await supabase
        .from("credit")
        .select("*")
        .order('id', ascending: true);
  }

  deleteUser(
      {required int id,
      required var context,
      required String emailAdmin}) async {
    try {
      simpleDialogueCardSansTitle(
          barrierDismissible: true, context: context, msg: "Patientez spv! ");
      await supabase.from("utilisateur").delete().eq("id", id).then((v) {
        Navigator.pop(context);
        alertDialogue(context, content: "Utilisateur supprimé");
        provider.Provider.of<AuthProvider>(context, listen: false)
            .initDataUtilisateur(email: emailAdmin);
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connexion perdu, réessayer plus tard");
      });
    } on AuthException catch (e) {
      alertDialogue(context, content: e.message);
    } on TimeoutException catch (e) {
      alertDialogue(context, content: e.message);
    } catch (e) {
      alertDialogue(context, content: e.toString());
    }
  }
}
