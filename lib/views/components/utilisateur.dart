// ignore_for_file: use_build_context_synchronously

import 'package:crm_sahel_telecom/Models/utilisateur.dart';
import 'package:crm_sahel_telecom/api/service_api.dart';
import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:crm_sahel_telecom/provider/auth_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart';

import '../../widget/add_utilisateur.dart';
import '../../widget/dialogue.dart';
import '../../widget/route.dart';

class UsersViews extends StatefulWidget {
  final Utilisateur user;
  const UsersViews({super.key, required this.user});

  @override
  State<UsersViews> createState() => _UsersViewsState();
}

class _UsersViewsState extends State<UsersViews> {
  bool showSpin = false;
  var search = TextEditingController();
  dynamic result;
  dynamic result2;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Liste des utilisateurs(${value.listUtilisateur!.length})",
                      style: material.Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: TextBox(
                      controller: search,
                      highlightColor: Palette.secondColor,
                      keyboardType: TextInputType.emailAddress,
                      placeholder: 'Recherche (e-mail)',
                      suffix: const Icon(FluentIcons.search),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          Provider.of<AuthProvider>(context, listen: false)
                              .initDataUtilisateur(email: widget.user.email);
                        } else {
                          Provider.of<AuthProvider>(context, listen: false)
                              .searchInListUtilisateur(value, "email");
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  FilledButton(
                      child: const Text("Actualiser"),
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .initDataUtilisateur(email: widget.user.email);
                      }),
                  const SizedBox(width: 15.0),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.37),
                    child: FilledButton(
                        child: const Text("Nouveau utilisateur"),
                        onPressed: () {
                          actionDialogue(
                              context: context,
                              child: AddUtilisateur(user: widget.user));
                        }),
                  )
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
                        material.DataColumn(label: Text("grade")),
                        material.DataColumn(label: Text("Action")),
                      ], rows: [
                        for (var i = 0; i < value.listUtilisateur!.length; i++)
                          material.DataRow(
                              color: i % 2 == 0
                                  ? value.listUtilisateur![i]['statut']
                                      ? material.MaterialStateProperty.all(
                                          Palette.grey.withOpacity(0.3))
                                      : material.MaterialStateProperty.all(
                                          Palette.red.withOpacity(0.3))
                                  : value.listUtilisateur![i]['statut']
                                      ? material.MaterialStateProperty.all(
                                          Palette.ligthBg.withOpacity(0.3))
                                      : material.MaterialStateProperty.all(
                                          Palette.red.withOpacity(0.3)),
                              cells: [
                                material.DataCell(Text("${i + 1}")),
                                material.DataCell(
                                    Text(value.listUtilisateur![i]['pseudo'])),
                                material.DataCell(Text(
                                    "${value.listUtilisateur![i]['nom']} ${value.listUtilisateur![i]['prenom']}")),
                                material.DataCell(SelectableText(
                                    value.listUtilisateur![i]['email'])),
                                material.DataCell(
                                    Text(value.listUtilisateur![i]['grade'])),
                                material.DataCell(Row(
                                  children: [
                                    FilledButton(
                                      style: ButtonStyle(
                                          backgroundColor: ButtonState.all(
                                              !value.listUtilisateur![i]
                                                      ['statut']
                                                  ? Palette.primaryColor
                                                  : Palette.red)),
                                      child: Text(value.listUtilisateur![i]
                                              ['statut']
                                          ? "Désac"
                                          : "Activ"),
                                      onPressed: () {
                                        changeStatutUser(
                                            id: value.listUtilisateur![i]['id'],
                                            statut: value.listUtilisateur![i]
                                                ['statut']);
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: FilledButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                ButtonState.all(Colors.red)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(
                                            material.Icons.delete,
                                            color: Palette.whtite,
                                          ),
                                        ),
                                        onPressed: () async {
                                          result = await deleteUser(
                                              id: value.listUtilisateur![i]
                                                  ['id']);
                                        },
                                      ),
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

  void changeStatutUser({int? id, bool? statut}) async {
    result2 = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        content: Text("${statut! ? "Désactivé" : "Activé"} l'utilisateur ?",
            style: const TextStyle(fontSize: 25.0),
            textAlign: TextAlign.center),
        actions: [
          FilledButton(
            child: const Text('Oui'),
            onPressed: () => Navigator.pop(context, "Oui"),
          ),
          FilledButton(
            style: ButtonStyle(backgroundColor: ButtonState.all(Colors.grey)),
            child: const Text('Non'),
            onPressed: () => Navigator.pop(context, "Oui"),
          ),
        ],
      ),
    );
    setState(() {});
    if (result2 == "Oui") {
      statut!
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
    }
  }

  var service = ServiceApi();
  deleteUser({int? id}) async {
    result = await showDialog(
      context: context,
      builder: (context) => ContentDialog(
        content: const Text("Voulez-vous vraiment supprimé l'utilisateur?",
            style: TextStyle(fontSize: 25.0), textAlign: TextAlign.center),
        actions: [
          FilledButton(
            child: const Text('Oui'),
            onPressed: () => Navigator.pop(context, "Oui"),
          ),
          FilledButton(
            style: ButtonStyle(backgroundColor: ButtonState.all(Colors.grey)),
            child: const Text('Non'),
            onPressed: () => Navigator.pop(context, "Non"),
          ),
        ],
      ),
    );
    setState(() {});
    if (result == "Oui") {
      service.deleteUser(
          id: id!, context: context, emailAdmin: widget.user.email!);
    }
  }
}
