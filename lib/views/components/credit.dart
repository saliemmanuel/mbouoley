import 'package:provider/provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluent_ui/fluent_ui.dart';

import '../../config/palette.dart';
import '../../provider/auth_provider.dart';
import '../../widget/add_credit.dart';
import '../../widget/route.dart';
import 'package:crm_sahel_telecom/Models/utilisateur.dart';

class Credits extends StatefulWidget {
  final Utilisateur user;

  const Credits({super.key, required this.user});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).initDataCredit();
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
          child: value.listCredit!.isEmpty
              ? const SizedBox(
                  child: material.Center(child: Text("Chargement...")))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "Liste des crédits(${value.listCredit!.length})",
                            style:
                                material.Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        FilledButton(
                            child: const Text("Nouveau crédit"),
                            onPressed: () {
                              actionDialogue(
                                  context: context,
                                  child: AddCredit(user: widget.user));
                            })
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
                              material.DataColumn(
                                  label: Text("Secteur profession")),
                              material.DataColumn(
                                  label: Text("Montant sollicité")),
                              material.DataColumn(label: Text("Durée du prêt")),
                              material.DataColumn(label: Text("Type de prêt")),
                              material.DataColumn(label: Text("Décision")),
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
                                      material.DataCell(Text(
                                          value.listCredit![i]['nomcompte'])),
                                      material.DataCell(Text(
                                          "${value.listCredit![i]['codeagence']}")),
                                      material.DataCell(Text(
                                          "${value.listCredit![i]['secteurprof']}")),
                                      material.DataCell(Text(
                                          value.listCredit![i]['secteurprof'])),
                                      material.DataCell(Text(
                                          value.listCredit![i]['loanTerm'])),
                                      material.DataCell(Text(
                                          value.listCredit![i]['typecredit'])),
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
                                                    child:
                                                        const Text("Accordé"),
                                                    onPressed: () {})
                                                : FilledButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            ButtonState.all(
                                                                Colors.red)),
                                                    child: const Text("Refusé"),
                                                    onPressed: () {})),
                                      ),
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
