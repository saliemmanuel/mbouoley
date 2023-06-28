import 'package:flutter/material.dart';

class Facture extends StatefulWidget {
  const Facture({super.key});

  @override
  State<Facture> createState() => _FactureState();
}

class _FactureState extends State<Facture> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Facture"),
    );
  }
}
