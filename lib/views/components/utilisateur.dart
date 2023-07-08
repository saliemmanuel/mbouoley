import 'package:crm_sahel_telecom/Models/utilisateur.dart';
import 'package:crm_sahel_telecom/api/service_api.dart';
import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:crm_sahel_telecom/provider/auth_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart';

import '../../widget/add_utilisateur.dart';
import '../../widget/route.dart';

class UsersViews extends StatefulWidget {
  final Utilisateur user;
  const UsersViews({super.key, required this.user});

  @override
  State<UsersViews> createState() => _UsersViewsState();
}

class _UsersViewsState extends State<UsersViews> {
  bool showSpin = false;
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false)
        .initDataUtilisateur(email: widget.user.email);
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
              ? const SizedBox(child: Center(child: Text("Chargement...")))
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
                            child: const Text("Nouveau"),
                            onPressed: () {
                              actionDialogue(
                                  context: context,
                                  child: AddUtilisateur(user: widget.user));
                            })
                      ],
                    ),
                    const Divider(),
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
                                        ? value.listUtilisateur![i]['statut']
                                            ? material.MaterialStateProperty.all(
                                                Palette.grey.withOpacity(0.3))
                                            : material.MaterialStateProperty.all(
                                                Palette.red.withOpacity(0.3))
                                        : value.listUtilisateur![i]['statut']
                                            ? material.MaterialStateProperty
                                                .all(Palette.ligthBg
                                                    .withOpacity(0.3))
                                            : material.MaterialStateProperty
                                                .all(Palette.red
                                                    .withOpacity(0.3)),
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
                                                        !value.listUtilisateur![
                                                                i]['statut']
                                                            ? Palette
                                                                .primaryColor
                                                            : Palette.red)),
                                            child: Text(
                                                value.listUtilisateur![i]
                                                        ['statut']
                                                    ? "Désac"
                                                    : "Activ"),
                                            onPressed: () {
                                              changeStatutUser(
                                                  id: value.listUtilisateur![i]
                                                      ['id'],
                                                  statut:
                                                      value.listUtilisateur![i]
                                                          ['statut']);
                                            },
                                          ),
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

  void changeStatutUser({int? id, bool? statut}) {
    showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        content: Text("${statut! ? "Désactivé" : "Activé"} l'utilisateur ?",
            style: const TextStyle(fontSize: 25.0),
            textAlign: TextAlign.center),
        actions: [
          FilledButton(
            child: const Text('Oui'),
            onPressed: () async {
              statut
                  ? await ServiceApi()
                      .changeStatutUser(context: context, id: id, statut: false)
                      .whenComplete(() {
                      Provider.of<AuthProvider>(context, listen: false)
                          .initDataUtilisateur(email: widget.user.email);
                    })
                  : await ServiceApi()
                      .changeStatutUser(context: context, id: id, statut: true)
                      .whenComplete(() {
                      Provider.of<AuthProvider>(context, listen: false)
                          .initDataUtilisateur(email: widget.user.email);
                    });
              Navigator.pop(context);
            },
          ),
          FilledButton(
            style: ButtonStyle(backgroundColor: ButtonState.all(Colors.grey)),
            child: const Text('Non'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
