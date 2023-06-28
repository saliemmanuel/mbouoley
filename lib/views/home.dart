import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:crm_sahel_telecom/views/components/dash_board.dart';
import 'package:crm_sahel_telecom/views/components/credit.dart';
import 'package:crm_sahel_telecom/views/components/settings.dart';
import 'package:crm_sahel_telecom/widget/widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/utilisateur.dart';
import '../provider/auth_provider.dart';
import 'components/utilisateur.dart';

class Home extends StatefulWidget {
  final Utilisateur user;
  const Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int topIndex = 0;

  @override
  Widget build(BuildContext context) {
    final content = [
      const DashBoard(),
      UsersViews(user: widget.user),
      const Credits(),
      const Settings(),
    ];

    var item = [
      HomeItem(
        indexItem: 0,
        icon: FluentIcons.home,
        label: "Accueil",
        isActive: false,
        onTap: () {
          Provider.of<AuthProvider>(context, listen: false).changeHomeIndex(0);
          setState(() {});
        },
      ),
      HomeItem(
        indexItem: 1,
        icon: FluentIcons.reminder_group,
        label: "Utilisateurs",
        isActive: false,
        onTap: () {
          Provider.of<AuthProvider>(context, listen: false).changeHomeIndex(1);
          setState(() {});
        },
      ),
      HomeItem(
        indexItem: 2,
        icon: FluentIcons.money,
        label: "Crédits",
        isActive: false,
        onTap: () {
          Provider.of<AuthProvider>(context, listen: false).changeHomeIndex(2);
          setState(() {});
        },
      ),
      HomeItem(
        indexItem: 3,
        icon: FluentIcons.settings,
        label: "Paramètres",
        isActive: false,
        onTap: () {
          Provider.of<AuthProvider>(context, listen: false).changeHomeIndex(3);
          setState(() {});
        },
      ),
    ];
    return BodyApp(
      child: Scaffold(
        backgroundColor: Palette.ligthBg,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 190,
              child: Stack(
                children: [
                  Container(
                      height: 120.0,
                      decoration: const BoxDecoration(
                          color: Palette.swatch,
                          image: DecorationImage(
                              image: AssetImage("assets/pattern.png"),
                              fit: BoxFit.cover)),
                      child: const HeaderHome()),
                  Positioned(
                    top: 80.0,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 300.0, right: 300.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Palette.whtite,
                          boxShadow: [
                            BoxShadow(
                                color: Palette.grey.withOpacity(0.2),
                                blurRadius: 2.0,
                                offset: const Offset(1, 0))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var element = 0;
                                    element < item.length;
                                    element++)
                                  HomeItem(
                                    indexItem: item[element].indexItem,
                                    icon: item[element].icon,
                                    label: item[element].label,
                                    isActive: item[element].indexItem ==
                                        Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .topIndex,
                                    onTap: item[element].onTap,
                                  )
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500.0,
              child: content[
                  Provider.of<AuthProvider>(context, listen: false).topIndex!],
            )
          ],
        )),
      ),
    );
  }
}
