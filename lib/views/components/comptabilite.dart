import 'package:flutter/material.dart';

class Comptabilite extends StatefulWidget {
  const Comptabilite({super.key});

  @override
  State<Comptabilite> createState() => _ComptabiliteState();
}

class _ComptabiliteState extends State<Comptabilite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Compta"),
    );
  }
}
