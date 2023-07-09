import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

import '../Models/credits.dart';

class DisplayPrediction extends StatefulWidget {
  final Credits credits;
  const DisplayPrediction({super.key, required this.credits});

  @override
  State<DisplayPrediction> createState() => _DisplayPredictionState();
}

class _DisplayPredictionState extends State<DisplayPrediction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680.0,
      width: 980.0,
      alignment: Alignment.center,
      color: Palette.ligthBg,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: const material.Icon(material.Icons.close,
                        color: Palette.red),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
            const SizedBox(height: 15.0),
            const Text("Resultat de l'Analyse"),
            const SizedBox(height: 25.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.nomcompte,
                    expands: false,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.codeagence,
                    expands: false,
                    enabled: false,
                    placeholderStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.nomprenom,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    placeholder: widget.credits.age,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    placeholder: widget.credits.lieu,
                    expands: false,
                    enabled: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    placeholder: widget.credits.sexe,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    placeholder: widget.credits.niveauetude,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    placeholder: widget.credits.situationmatri,
                    expands: false,
                    enabled: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    keyboardType: TextInputType.emailAddress,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    placeholder: widget.credits.secteurprof,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.revenu,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.typecredit,
                    expands: false,
                    enabled: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.loanAmount,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.interestRate,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.loanTerm,
                    expands: false,
                    enabled: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.catcredit,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.quotite,
                    expands: false,
                    enabled: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.logement,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.npaCharge,
                    expands: false,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextBox(
                    highlightColor: Palette.secondColor,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    placeholder: widget.credits.loanNbr,
                    expands: false,
                    enabled: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Est un employer du Crédit du Sahel ?"),
                      const SizedBox(width: 15.0),
                      RadioButton(
                        checked: true,
                        onChanged: (value) {},
                        content: Text(widget.credits.isEmployeeSahel),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 70.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("A une activité secondaire ?"),
                      const SizedBox(width: 10.0),
                      RadioButton(
                        checked: true,
                        onChanged: (value) {},
                        content: Text(widget.credits.activiteSecondaire),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
                child: widget.credits.prediction == "4"
                    ? Card(
                        backgroundColor: Colors.green,
                        child: const Text("Accordé",
                            style: TextStyle(color: Colors.white)),
                      )
                    : Card(
                        backgroundColor: Colors.red,
                        child: const Text("Refusé",
                            style: TextStyle(color: Colors.white)))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  style: ButtonStyle(
                      backgroundColor: ButtonState.all(Palette.red)),
                  child: const Text("Fermer"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10.0),
              ],
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
