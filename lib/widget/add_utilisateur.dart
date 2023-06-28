import 'package:crm_sahel_telecom/Models/utilisateur.dart';
import 'package:crm_sahel_telecom/api/service_api.dart';
import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:lottie/lottie.dart';

import 'dialogue.dart';

class AddUtilisateur extends StatefulWidget {
  final Utilisateur user;
  const AddUtilisateur({super.key, required this.user});

  @override
  State<AddUtilisateur> createState() => _AddUtilisateurState();
}

class _AddUtilisateurState extends State<AddUtilisateur> {
  bool showWarning = true;
  bool showSpine = false;
  var pseudo = TextEditingController();
  var nom = TextEditingController();
  var prenom = TextEditingController();
  var email = TextEditingController();
  var service = ServiceApi();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Palette.ligthBg,
      width: 400.0,
      height: showWarning ? 480.0 : 400,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: const material.Icon(material.Icons.close,
                        color: Palette.red),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
            const SizedBox(height: 15.0),
            const Text("Ajout utilisateur"),
            const SizedBox(height: 15.0),
            TextBox(
              controller: pseudo,
              highlightColor: Palette.secondColor,
              keyboardType: TextInputType.emailAddress,
              placeholder: 'Pseudo utilisateur',
              expands: false,
            ),
            const SizedBox(height: 15.0),
            TextBox(
              controller: nom,
              highlightColor: Palette.secondColor,
              keyboardType: TextInputType.emailAddress,
              placeholder: 'Nom utilisateur',
              expands: false,
            ),
            const SizedBox(height: 15.0),
            TextBox(
              controller: prenom,
              highlightColor: Palette.secondColor,
              keyboardType: TextInputType.emailAddress,
              placeholder: 'Prenom utilisateur',
              expands: false,
            ),
            const SizedBox(height: 15.0),
            TextBox(
              controller: email,
              highlightColor: Palette.secondColor,
              keyboardType: TextInputType.emailAddress,
              placeholder: 'E-mail utilisateur',
              expands: false,
            ),
            const SizedBox(height: 15.0),
            Visibility(
              visible: showWarning,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.warningSecondaryColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  leading: Container(
                    height: 60.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                        color: Colors.warningPrimaryColor,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  title: const Row(
                    children: [
                      Icon(
                        FluentIcons.warning,
                        size: 20.0,
                        color: Colors.warningPrimaryColor,
                      ),
                      Text(" Attention !!!")
                    ],
                  ),
                  subtitle: const Text(
                      "Le mot de passe de l'utilisateur par défaut sont email."),
                  trailing: IconButton(
                      icon: const material.Icon(material.Icons.close,
                          color: Palette.red),
                      onPressed: () {
                        setState(() {
                          showWarning = !showWarning;
                        });
                      }),
                ),
              ),
            ),
            const SizedBox(height: 35.0),
            Visibility(
              visible: !showSpine,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all(Palette.red)),
                    child: const Text("Annuler"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10.0),
                  FilledButton(
                    child: const Text("Enregistrer"),
                    onPressed: () {
                      if (pseudo.text.isEmpty ||
                          nom.text.isEmpty ||
                          prenom.text.isEmpty ||
                          email.text.isEmpty) {
                        alertDialogue(context,
                            content: "Remplissez tous les champs svp!");
                      } else {
                        if (service.isEmail(email.text)) {
                          setState(() {
                            showSpine = !showSpine;
                          });
                          service.addUser(
                              emailAdmin: widget.user.email,
                              context: context,
                              utilisateur: Utilisateur(
                                  email: email.text,
                                  nom: nom.text,
                                  prenom: prenom.text,
                                  pseudo: pseudo.text,
                                  grade: "user",
                                  statut: true));
                        } else {
                          alertDialogue(context, content: "E-mail invalide");
                        }
                      }
                    },
                  )
                ],
              ),
            ),
            Visibility(
                visible: showSpine,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Lottie.asset('assets/lotties/loading.json',
                          width: 95.0),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
