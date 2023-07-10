import 'package:provider/provider.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../Models/utilisateur.dart';
import '../../config/palette.dart';
import '../../provider/auth_provider.dart';

class Settings extends StatefulWidget {
  final Utilisateur user;

  const Settings({super.key, required this.user});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                    color: Palette.whtite,
                    blurRadius: 2.0,
                    offset: Offset(1, 0))
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(FluentIcons.user_window),
                      title: Text(
                          'Nom et prenom : ${widget.user.nom} ${widget.user.nom}'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: ListTile(
                      leading: const Icon(FluentIcons.user_window),
                      title: Text('Pseudo : ${widget.user.pseudo}'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: ListTile(
                      leading: const Icon(FluentIcons.user_window),
                      title: Text('E-mail : ${widget.user.email}'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: ListTile(
                      leading: const Icon(FluentIcons.user_window),
                      title: Text('Grade : ${widget.user.grade}'),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
