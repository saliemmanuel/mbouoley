import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as ma;

import '../config/palette.dart';

alertDialogue(var context, {String? content}) {
  return showDialog(
    context: context,
    builder: (context) => ContentDialog(
      content: Text(content!,
          style: const TextStyle(fontSize: 25.0), textAlign: TextAlign.center),
      actions: [
        FilledButton(
          child: const Text('Fermer'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Future simpleDialogueCardSansTitle(
    {String? msg, BuildContext? context, bool? barrierDismissible = false}) {
  return showDialog(
      context: context!,
      barrierDismissible: barrierDismissible!,
      builder: (BuildContext context) {
        return ContentDialog(
          content: Row(
            children: [
              const ma.CircularProgressIndicator(color: Palette.primaryColor),
              const SizedBox(width: 15.0),
              Text(msg!)
            ],
          ),
        );
      });
}
