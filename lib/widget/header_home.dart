import 'package:crm_sahel_telecom/api/service_api.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/logo.png"),
      title: const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(
          "CREDIT DU SAHEL SA",
          style: TextStyle(color: Colors.white),
        ),
      ),
      subtitle: const Text(
        "Proche de vous pour le progrès.",
        style: TextStyle(color: Colors.white),
      ),
      trailing: material.InkWell(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (context) => ContentDialog(
              content: const Text("Souhaitez-vous vraiment vous déconnecter ?",
                  style: TextStyle(fontSize: 25.0),
                  textAlign: TextAlign.center),
              actions: [
                FilledButton(
                  style:
                      ButtonStyle(backgroundColor: ButtonState.all(Colors.red)),
                  child: const Text('Déconnexion'),
                  onPressed: () => ServiceApi().deconnexion(context: context),
                ),
                FilledButton(
                  style: ButtonStyle(
                      backgroundColor: ButtonState.all(Colors.grey)),
                  child: const Text('Annuler'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 20.0, right: 15.0),
          child: Column(
            children: [
              Icon(
                FluentIcons.leave,
                color: Colors.white,
              ),
              Text(
                "Déconnexion",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
