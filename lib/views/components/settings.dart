import 'package:provider/provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluent_ui/fluent_ui.dart';

import '../../config/palette.dart';
import '../../provider/auth_provider.dart';
import '../../widget/add_utilisateur.dart';
import '../../widget/route.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

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
            child: Text("dsd"));
      },
    );
  }
}
