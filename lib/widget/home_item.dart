import 'package:animate_do/animate_do.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

import '../config/palette.dart';

class HomeItem extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final bool isActive;
  final int? indexItem;
  final void Function()? onTap;
  const HomeItem(
      {super.key,
      required this.label,
      this.isActive = false,
      required this.onTap,
      required this.icon,
      required this.indexItem});

  @override
  Widget build(BuildContext context) {
    return material.InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50.0,
        width: 150.0,
        child: Column(
          children: [
            Expanded(
              child: ListTile(
                onPressed: onTap,
                leading: Icon(icon),
                title: Text(label!),
              ),
            ),
            Visibility(
                visible: isActive,
                child: JelloIn(
                  animate: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      height: 2.0,
                      width: 70.0,
                      color: Palette.primaryColor,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
