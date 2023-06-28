import 'package:flutter/material.dart';

class MicroZone extends StatefulWidget {
  const MicroZone({super.key});

  @override
  State<MicroZone> createState() => _MicroZoneState();
}

class _MicroZoneState extends State<MicroZone> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Micro zone"),
    );
  }
}
