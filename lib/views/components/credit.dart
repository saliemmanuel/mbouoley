import 'package:provider/provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluent_ui/fluent_ui.dart';

import '../../config/palette.dart';
import '../../provider/auth_provider.dart';
import '../../widget/add_credit.dart';
import '../../widget/route.dart';

class Credits extends StatefulWidget {
  const Credits({super.key});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(
              left: 70.0, right: 70.0, top: 10.0, bottom: 50.0),
          padding: const EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Palette.whtite,
            boxShadow: const [
              BoxShadow(
                  color: Palette.whtite, blurRadius: 2.0, offset: Offset(1, 0))
            ],
          ),
          child: value.listUtilisateur!.isEmpty
              ? const SizedBox(
                  child: material.Center(child: Text("Chargement")))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "Liste des utilisateurs(${value.listUtilisateur!.length})",
                            style:
                                material.Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        FilledButton(
                            child: const Text("Nouveau crédit"),
                            onPressed: () {
                              actionDialogue(
                                  context: context, child: const AddCredit());
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
                              material.DataColumn(label: Text("Pseudo")),
                              material.DataColumn(label: Text("Nom et prénom")),
                              material.DataColumn(label: Text("Email")),
                              material.DataColumn(label: Text("Action")),
                            ], rows: [
                              for (var i = 0;
                                  i < value.listUtilisateur!.length;
                                  i++)
                                material.DataRow(
                                    color: i % 2 == 0
                                        ? material.MaterialStateProperty.all(
                                            Palette.grey.withOpacity(0.3))
                                        : material.MaterialStateProperty.all(
                                            Palette.ligthBg),
                                    cells: [
                                      material.DataCell(Text("${i + 1}")),
                                      material.DataCell(Text(
                                          value.listUtilisateur![i]['pseudo'])),
                                      material.DataCell(Text(
                                          "${value.listUtilisateur![i]['nom']} ${value.listUtilisateur![i]['prenom']}")),
                                      material.DataCell(Text(
                                          value.listUtilisateur![i]['email'])),
                                      material.DataCell(Row(
                                        children: [
                                          FilledButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    ButtonState.all(
                                                        Palette.red)),
                                            child: const Text("Désac"),
                                            onPressed: () {},
                                          ),
                                          const SizedBox(width: 10.0),
                                          FilledButton(
                                            child: const Text("Détail"),
                                            onPressed: () {},
                                          )
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
