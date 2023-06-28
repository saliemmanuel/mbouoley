import 'package:flutter/material.dart';

pushNewPage(Widget page, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

pushNewPageRemoveUntil(Widget page, BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }), (Route route) => false);
}

actionDialogue({context, child}) {
  return showDialog(
      barrierColor: Colors.grey.withOpacity(0.5),
      context: context,
      builder: (_) {
        return AlertDialog(backgroundColor: Colors.transparent, content: child);
      });
}
