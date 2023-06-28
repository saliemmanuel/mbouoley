import 'package:crm_sahel_telecom/widget/windows_app_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../config/palette.dart';

class BodyApp extends StatelessWidget {
  final Widget child;
  const BodyApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
        content: Column(children: [
      const WindowsAppBar(),
      Expanded(child: child),
      Container(
        alignment: Alignment.center,
        color: Palette.secondColor,
        height: 30.0,
        width: MediaQuery.of(context).size.width,
        child: const Text(
          "Copyright © 2023, Crédit Du Sahel.",
          style: TextStyle(color: Colors.white),
        ),
      )
    ]));
  }
}
