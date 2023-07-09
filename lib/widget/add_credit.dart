import 'package:crm_sahel_telecom/api/service_api.dart';
import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:lottie/lottie.dart';

import '../Models/credits.dart';
import 'dialogue.dart';
import 'package:crm_sahel_telecom/Models/utilisateur.dart';

class AddCredit extends StatefulWidget {
  final Utilisateur user;
  const AddCredit({super.key, required this.user});

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  bool showSpine = false;
  var numcompte = TextEditingController();
  var codeagence = TextEditingController();
  var nomprenom = TextEditingController();
  var age = TextEditingController();
  var lieu = TextEditingController();
  var revenu = TextEditingController();
  var montantcollicite = TextEditingController();
  var taux = TextEditingController();
  var duree = TextEditingController();
  var quotite = TextEditingController();
  var nombreenfcharge = TextEditingController();
  var creditcontract = TextEditingController();
  var service = ServiceApi();
  int haveSecondActi = 3;
  int isEmployeeSahel = 3;
  var radioButtons = <String>['Oui', 'Non'];
  var radioButtonsZ = <String>['Oui', 'Non'];
  String? selectedTypeCredit;
  String? selectedCatCredit;
  String? selectedLogement;
  String? selectedMatri;
  String? selectedGenre;
  String? selectedSecteurProf;
  String? selectedNiveau;

  List<String> typeCredit = [
    "Scolaire(SCO)",
    "Immobilier(IMM)",
    "Investissement(INV)",
    "Autre"
  ];
  List<String> catsCredit = ["Court terme", "Long terme", "Moyen terme"];
  List<String> logement = ["Locataire", "Propriété"];
  List<String> matrimonial = ["Marié", "Célibataire", "Veuf"];
  List<String> genre = ["Homme", "Femme"];
  List<String> profession = ["Public", "Privé", "Pensionnaire"];
  List<String> niveau = ["Primaire", "Sécondaire", "Suppérieur", "Rien"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620.0,
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
                    controller: numcompte,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'N° compte',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: codeagence,
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
                    controller: nomprenom,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Nom et prénom',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: age,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Age',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: lieu,
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
                        value: e,
                        child: Text(e),
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
                    controller: revenu,
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
                    items: typeCredit.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        value: e,
                        child: Text(e),
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
                    controller: montantcollicite,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: 'Montant sollicité',
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: taux,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Taux d'intérêt",
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: duree,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Durée du prêt",
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
                    value: selectedCatCredit,
                    items: catsCredit.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() => selectedCatCredit = color);
                    },
                    placeholder: const Text('Cathégorie crédit'),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: quotite,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Quotité",
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
                    controller: nombreenfcharge,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Nombre de personnes en charge",
                    expands: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    controller: creditcontract,
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "Nombre de crédit déjà contracté",
                    expands: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Wrap(
              children: [
                Row(
                  children: [
                    const Text("Est un employer du Crédit du Sahel ?"),
                    const SizedBox(width: 15.0),
                    ...List.generate(radioButtonsZ.length, (vindex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RadioButton(
                          checked: isEmployeeSahel == vindex,
                          onChanged: (value) {
                            setState(() {
                              isEmployeeSahel = vindex;
                            });
                          },
                          content: Text(radioButtons[vindex]),
                        ),
                      );
                    })
                  ],
                ),
                const SizedBox(width: 70.0),
                Row(
                  children: [
                    const Text("A une activité secondaire ?"),
                    const SizedBox(width: 10.0),
                    ...List.generate(radioButtons.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RadioButton(
                          checked: haveSecondActi == index,
                          onChanged: (value) {
                            setState(() {
                              haveSecondActi = index;
                            });
                          },
                          content: Text(radioButtons[index]),
                        ),
                      );
                    })
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
                    child: const Text("Analyser"),
                    onPressed: () {
                      showSpine = true;
                      setState(() {});
                      if (numcompte.text.isEmpty ||
                          codeagence.text.isEmpty ||
                          nomprenom.text.isEmpty ||
                          age.text.isEmpty ||
                          lieu.text.isEmpty ||
                          revenu.text.isEmpty ||
                          montantcollicite.text.isEmpty ||
                          taux.text.isEmpty ||
                          duree.text.isEmpty ||
                          quotite.text.isEmpty ||
                          nombreenfcharge.text.isEmpty ||
                          creditcontract.text.isEmpty ||
                          selectedTypeCredit == null ||
                          selectedCatCredit == null ||
                          selectedLogement == null ||
                          selectedMatri == null ||
                          selectedGenre == null ||
                          selectedSecteurProf == null ||
                          selectedNiveau == null) {
                        alertDialogue(context,
                            content: "Remplissez tous les champs svp!");
                      } else {
                        if (int.tryParse(age.text) == null) {
                          alertDialogue(context,
                              content: "Le champ année doit être un entier");
                        } else if (double.tryParse(revenu.text) == null) {
                          alertDialogue(context,
                              content: "Le champ revenu doit être un réel");
                        } else if (double.tryParse(montantcollicite.text) ==
                            null) {
                          alertDialogue(context,
                              content:
                                  "Le champ montant sollicite doit être un réel");
                        } else if (double.tryParse(taux.text) == null) {
                          alertDialogue(context,
                              content:
                                  "Le champ montant taux doit être un réel");
                        } else if (double.tryParse(duree.text) == null) {
                          alertDialogue(context,
                              content: "Le champ duree doit être un entier");
                        } else if (int.tryParse(nombreenfcharge.text) == null) {
                          alertDialogue(context,
                              content: "Le champ duree doit être un entier");
                        } else if (int.tryParse(creditcontract.text) == null) {
                          alertDialogue(context,
                              content: "Le champ duree doit être un entier");
                        } else if (isEmployeeSahel == 3) {
                          alertDialogue(context,
                              content:
                                  "Vous n'avez pas repondu à la question :\nEst un employer du Crédit du Sahel ?");
                        } else if (haveSecondActi == 3) {
                          alertDialogue(context,
                              content:
                                  "Vous n'avez pas repondu à la question :\nA une activité secondaire ?");
                        } else {
                          service.storeModelPrediction(
                              credits: Credits(
                                auteur: "${widget.user.nom}${widget.user.nom}",
                                nomcompte: numcompte.text,
                                codeagence: codeagence.text,
                                nomprenom: nomprenom.text,
                                age: age.text,
                                lieu: lieu.text,
                                revenu: revenu.text,
                                loanAmount: montantcollicite.text,
                                taux: taux.text,
                                loanTerm: duree.text,
                                quotite: quotite.text,
                                npaCharge: nombreenfcharge.text,
                                loanNbr: creditcontract.text,
                                activiteSecondaire:
                                    haveSecondActi == 0 ? "Oui" : "Non",
                                isEmployeeSahel:
                                    isEmployeeSahel == 0 ? "Oui" : "Non",
                                typecredit: selectedTypeCredit!,
                                catcredit: selectedCatCredit!,
                                logement: selectedLogement!,
                                situationmatri: selectedMatri!,
                                sexe: selectedGenre!,
                                secteurprof: selectedSecteurProf!,
                                niveauetude: selectedNiveau!,
                                interestRate: taux.text,
                                prediction: "",
                              ),
                              contexte: context);
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
                )),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
