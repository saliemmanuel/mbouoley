import 'package:fluent_ui/fluent_ui.dart';

alertDialogue(var context, {String? content}) {
  return showDialog<String>(
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
