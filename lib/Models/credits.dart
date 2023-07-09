import 'dart:convert';

class Credits {
  final String interestRate;
  final String loanTerm;
  final String age;
  final String lieu;
  final String loanAmount;
  final String sexe;
  final String revenu;
  final String taux;
  final String loanNbr;
  final String logement;
  final String npaCharge;
  final String activiteSecondaire;
  final String nomcompte;
  final String codeagence;
  final String nomprenom;
  final String niveauetude;
  final String situationmatri;
  final String typecredit;
  final String secteurprof;
  final String catcredit;
  final String quotite;
  final String isEmployeeSahel;
  final String autr;
  String prediction;

  predictioSet(String newPrediction) {
    prediction = newPrediction;
  }
}
