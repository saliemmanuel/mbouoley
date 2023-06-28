import 'package:crm_sahel_telecom/Models/utilisateur.dart';
import 'package:crm_sahel_telecom/api/service_api.dart';
import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:lottie/lottie.dart';

import 'dialogue.dart';

class AddCredit extends StatefulWidget {
  const AddCredit({super.key});

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  bool showWarning = true;
  bool showSpine = false;
  var pseudo = TextEditingController();
  var nom = TextEditingController();
  var prenom = TextEditingController();
  var email = TextEditingController();
  var service = ServiceApi();
  DateTime? selected;
  bool checked = false;
  String? selectedTypeCredit;
  String? selectedLogement;
  String? selectedMatri;
  String? selectedGenre;
  String? selectedSecteurProf;
  String? selectedNiveau;
  List<String> cats = [
    "Scolaire(SCO)",
    "Immobilier(IMM)",
    "Investissement(INV)",
    "Affaire(AFF)",
  ];
  List<String> logement = ["Locataire", "Propriété"];
  List<String> matrimonial = [
    "Marié",
    "Célibataire",
    "Veuf",
  ];
  List<String> genre = [
    "Homme",
    "Femme",
  ];
  List<String> profession = [
    "Public",
    "Privé",
    "Pensionnaire",
  ];
  List<String> niveau = [
    "Primaire",
    "Sécondaire",
    "Suppérieur",
    "Rien",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.0,
      width: 980.0,
      alignment: Alignment.center,
      color: Palette.ligthBg,
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
            const Text("Attribution crédit"),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'N° compte',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Code agence',
                    expands: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Nom et prénom',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Année de naissance',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Lieu de naissance',
                    expands: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: ComboBox<String>(
                    value: selectedGenre,
                    items: genre.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() => selectedGenre = color);
                    },
                    placeholder: const Text('Genre'),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: ComboBox<String>(
                    value: selectedNiveau,
                    items: niveau.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() => selectedNiveau = color);
                    },
                    placeholder: const Text("Niveau d'étude"),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: ComboBox<String>(
                    value: selectedMatri,
                    items: matrimonial.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() => selectedMatri = color);
                    },
                    placeholder: const Text('Situation matrimoniale'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: ComboBox<String>(
                    value: selectedSecteurProf,
                    items: profession.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() => selectedSecteurProf = color);
                    },
                    placeholder: const Text('Secteur profession'),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Revenue mensuel',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: ComboBox<String>(
                    value: selectedTypeCredit,
                    items: cats.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() => selectedTypeCredit = color);
                    },
                    placeholder: const Text('Type crédit'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Montant sollicité',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Taux d'intérêt",
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Durée du prêt",
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Type de prêt",
                    expands: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: ComboBox<String>(
                    value: selectedLogement,
                    items: logement.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() => selectedLogement = color);
                    },
                    placeholder: const Text('Logement'),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Nombre d'enfant en charge",
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Nombre de crédit déjà contracté",
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: pseudo,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Quotité",
                    expands: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              children: [
                Row(
                  children: [
                    const Text("Est un employer du Crédit du Sahel ?"),
                    const SizedBox(width: 15.0),
                    Checkbox(
                      content: const Text("Oui"),
                      checked: checked,
                      onChanged: (bool? value) {
                        setState(() => checked = value!);
                      },
                    ),
                    const SizedBox(width: 20.0),
                    Checkbox(
                      content: const Text("Non"),
                      checked: checked,
                      onChanged: (bool? value) {
                        setState(() => checked = value!);
                      },
                    ),
                    const SizedBox(width: 70.0),
                    Row(
                      children: [
                        const Text("A une activité secondaire ?"),
                        const SizedBox(width: 10.0),
                        Checkbox(
                          content: const Text("Oui"),
                          checked: checked,
                          onChanged: (bool? value) {
                            setState(() => checked = value!);
                          },
                        ),
                        const SizedBox(width: 20.0),
                        Checkbox(
                          content: const Text("Non"),
                          checked: checked,
                          onChanged: (bool? value) {
                            setState(() => checked = value!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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
                    child: const Text("Annalyser"),
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
                          // service.addUser(
                          //     context: context,
                          //     utilisateur: Utilisateur(
                          //         email: email.text,
                          //         nom: nom.text,
                          //         prenom: prenom.text,
                          //         pseudo: pseudo.text,
                          //         grade: ,
                          //         statut: true));
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
