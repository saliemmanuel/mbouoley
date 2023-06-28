import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  WindowButtonsState createState() => WindowButtonsState();
}

class WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(
              mouseOver:
                  const Color.fromARGB(255, 134, 155, 143).withOpacity(0.2),
              mouseDown: Palette.primaryColor,
              iconNormal: Colors.black,
              iconMouseOver: Colors.black),
        ),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: WindowButtonColors(
                    mouseOver: const Color.fromARGB(255, 134, 155, 143)
                        .withOpacity(0.2),
                    mouseDown: Palette.primaryColor,
                    iconNormal: Colors.black,
                    iconMouseOver: Colors.black),
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: WindowButtonColors(
                    mouseOver: const Color.fromARGB(255, 134, 155, 143)
                        .withOpacity(0.2),
                    mouseDown: Palette.primaryColor,
                    iconNormal: Colors.black,
                    iconMouseOver: Colors.black),
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(
            colors: WindowButtonColors(
                mouseOver: const Color(0xFFD32F2F),
                mouseDown: const Color(0xFFD32F2F),
                iconNormal: Colors.black,
                iconMouseOver: Colors.white)),
      ],
    );
  }
}
