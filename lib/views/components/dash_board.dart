import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin:
          const EdgeInsets.only(left: 30.0, right: 30, top: 10.0, bottom: 50.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        image: const DecorationImage(
            image: AssetImage("assets/banniere-cds.jpg"), fit: BoxFit.fill),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 2.0,
              offset: const Offset(1, 0))
        ],
      ),
      alignment: Alignment.center,
      child: const Text(
        "Bienvenue sur MBOUOLEY ",
        style: TextStyle(fontSize: 55.0),
      ),
    );
  }
}
