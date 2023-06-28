import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:flutter/material.dart';

import 'custom_windows_button.dart';

class WindowsAppBar extends StatelessWidget {
  const WindowsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        color: Palette.ligthBg,
        child: Row(children: [
          Expanded(
              child: MoveWindow(
            child: const Row(
              children: [],
            ),
          )),
          Expanded(
              child: MoveWindow(
            child: const Row(
              children: [
                Text("MBOUOLEY", style: TextStyle(color: Colors.black)),
              ],
            ),
          )),
          const WindowButtons()
        ]),
      ),
    );
  }
}
