import 'package:provider/provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluent_ui/fluent_ui.dart';

import '../../Models/credits.dart';
import '../../config/palette.dart';
import '../../provider/auth_provider.dart';
import '../../widget/add_credit.dart';
import '../../widget/edite_credit.dart';
import '../../widget/route.dart';
import 'package:crm_sahel_telecom/Models/utilisateur.dart';
import 'package:crm_sahel_telecom/widget/display_prediction.dart';

class Credits extends StatefulWidget {
  final Utilisateur user;

  const Credits({super.key, required this.user});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(
              left: 65.0, right: 65.0, top: 10.0, bottom: 50.0),
          padding: const EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Palette.whtite,
            boxShadow: const [
              BoxShadow(
                  color: Palette.whtite, blurRadius: 2.0, offset: Offset(1, 0))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Liste des crédits(${value.listCredit!.length})",
                      style: material.Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: TextBox(
                      controller: search,
                      highlightColor: Palette.secondColor,
                      keyboardType: TextInputType.emailAddress,
                      placeholder: 'Recherche (Nom)',
                      suffix: const Icon(FluentIcons.search),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          Provider.of<AuthProvider>(context, listen: false)
                              .initDataCredit();
                        } else {
                          Provider.of<AuthProvider>(context, listen: false)
                              .searchInListCredits(value, "nomprenom");
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  FilledButton(
                      child: const Text("Actualiser"),
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .initDataCredit();
                      }),
                  const SizedBox(width: 20.0),
                  material.Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.37),
                    child: FilledButton(
                        child: const Text("Nouveau crédit"),
                        onPressed: () {
                          actionDialogue(
                              context: context,
                              child: AddCredit(user: widget.user));
                        }),
                  )
                ],
              ),
              const material.Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: material.DataTable(columns: const [
                        material.DataColumn(label: Text("N°")),
                        material.DataColumn(label: Text("N° de compte")),
                        material.DataColumn(label: Text("Code agence")),
                        material.DataColumn(label: Text("Nom et prenom")),
                        material.DataColumn(label: Text("Montant sollicité")),
                        material.DataColumn(label: Text("Type de prêt")),
                        material.DataColumn(label: Text("Décision")),
                        material.DataColumn(label: Text("Action")),
                      ], rows: [
                        for (var i = 0; i < value.listCredit!.length; i++)
                          material.DataRow(
                              color: i % 2 == 0
                                  ? material.MaterialStateProperty.all(
                                      Palette.grey.withOpacity(0.3))
                                  : material.MaterialStateProperty.all(
                                      Palette.ligthBg),
                              cells: [
                                material.DataCell(Text("${i + 1}")),
                                material.DataCell(
                                    Text(value.listCredit![i]['nomcompte'])),
                                material.DataCell(Text(
                                    "${value.listCredit![i]['codeagence']}")),
                                material.DataCell(Text(
                                    "${value.listCredit![i]['nomprenom']}")),
                                material.DataCell(
                                    Text(value.listCredit![i]['loanTerm'])),
                                material.DataCell(
                                    Text(value.listCredit![i]['typecredit'])),
                                material.DataCell(
                                  Container(
                                      child: value.listCredit![i]
                                                  ['prediction'] ==
                                              "4"
                                          ? FilledButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      ButtonState.all(
                                                          Colors.green)),
                                              child: const Text("Accordé"),
                                              onPressed: () {})
                                          : FilledButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      ButtonState.all(
                                                          Colors.red)),
                                              child: const Text("Refusé"),
                                              onPressed: () {})),
                                ),
                                material.DataCell(material.Row(
                                  children: [
                                    FilledButton(
                                        child: const Text("Détail"),
                                        onPressed: () {
                                          actionDialogue(
                                            context: context,
                                            child: DisplayPrediction(
                                                credits: CreditsModels(
                                                    age: value.listCredit![i]
                                                        ['age'],
                                                    activiteSecondaire: value.listCredit![i]
                                                        ['activiteSecondaire'],
                                                    auteur: value.listCredit![i]
                                                        ['auteur'],
                                                    catcredit: value.listCredit![i]
                                                        ['catcredit'],
                                                    codeagence: value.listCredit![i]
                                                        ['codeagence'],
                                                    interestRate: value.listCredit![i]
                                                        ['interestRate'],
                                                    isEmployeeSahel:
                                                        value.listCredit![i]
                                                            ['isEmployeeSahel'],
                                                    lieu: value.listCredit![i]
                                                        ['lieu'],
                                                    loanAmount: value.listCredit![i]
                                                        ['loanAmount'],
                                                    loanNbr: value.listCredit![i]
                                                        ['loanNbr'],
                                                    loanTerm: value.listCredit![i]['loanTerm'],
                                                    logement: value.listCredit![i]['logement'],
                                                    niveauetude: value.listCredit![i]['niveauetude'],
                                                    nomcompte: value.listCredit![i]['nomcompte'],
                                                    nomprenom: value.listCredit![i]['nomprenom'],
                                                    npaCharge: value.listCredit![i]['npaCharge'],
                                                    prediction: value.listCredit![i]['prediction'],
                                                    quotite: value.listCredit![i]['quotite'],
                                                    revenu: value.listCredit![i]['revenu'],
                                                    secteurprof: value.listCredit![i]['secteurprof'],
                                                    sexe: value.listCredit![i]['sexe'],
                                                    situationmatri: value.listCredit![i]['situationmatri'],
                                                    taux: value.listCredit![i]['taux'],
                                                    typecredit: value.listCredit![i]['typecredit'])),
                                          );
                                        }),
                                    const SizedBox(width: 10.0),
                                    if (widget.user.grade == "admin")
                                      FilledButton(
                                          style: ButtonStyle(
                                              backgroundColor: ButtonState.all(
                                                  Colors.purple)),
                                          child: const material.Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Icon(FluentIcons.edit),
                                          ),
                                          onPressed: () {
                                            actionDialogue(
                                              context: context,
                                              child: EditeCredit(
                                                  idCredit: value.listCredit![i]['id']
                                                      .toString(),
                                                  user: widget.user,
                                                  creditsModels: CreditsModels(
                                                      age: value.listCredit![i]
                                                          ['age'],
                                                      activiteSecondaire: value.listCredit![i][
                                                          'activiteSecondaire'],
                                                      auteur: value.listCredit![i]
                                                          ['auteur'],
                                                      catcredit: value.listCredit![i]
                                                          ['catcredit'],
                                                      codeagence: value.listCredit![i]
                                                          ['codeagence'],
                                                      interestRate: value.listCredit![i]
                                                          ['interestRate'],
                                                      isEmployeeSahel: value.listCredit![i]
                                                          ['isEmployeeSahel'],
                                                      lieu: value.listCredit![i]['lieu'],
                                                      loanAmount: value.listCredit![i]['loanAmount'],
                                                      loanNbr: value.listCredit![i]['loanNbr'],
                                                      loanTerm: value.listCredit![i]['loanTerm'],
                                                      logement: value.listCredit![i]['logement'],
                                                      niveauetude: value.listCredit![i]['niveauetude'],
                                                      nomcompte: value.listCredit![i]['nomcompte'],
                                                      nomprenom: value.listCredit![i]['nomprenom'],
                                                      npaCharge: value.listCredit![i]['npaCharge'],
                                                      prediction: value.listCredit![i]['prediction'],
                                                      quotite: value.listCredit![i]['quotite'],
                                                      revenu: value.listCredit![i]['revenu'],
                                                      secteurprof: value.listCredit![i]['secteurprof'],
                                                      sexe: value.listCredit![i]['sexe'],
                                                      situationmatri: value.listCredit![i]['situationmatri'],
                                                      taux: value.listCredit![i]['taux'],
                                                      typecredit: value.listCredit![i]['typecredit'])),
                                            );
                                          }),
                                  ],
                                )),
                              ])
                      ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
