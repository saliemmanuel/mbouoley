import 'dart:convert';

class CreditsModels {
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
  final String auteur;
  String prediction;
  CreditsModels({
    required this.interestRate,
    required this.loanTerm,
    required this.age,
    required this.lieu,
    required this.loanAmount,
    required this.sexe,
    required this.revenu,
    required this.taux,
    required this.loanNbr,
    required this.logement,
    required this.npaCharge,
    required this.activiteSecondaire,
    required this.nomcompte,
    required this.codeagence,
    required this.nomprenom,
    required this.niveauetude,
    required this.situationmatri,
    required this.typecredit,
    required this.secteurprof,
    required this.catcredit,
    required this.quotite,
    required this.isEmployeeSahel,
    required this.auteur,
    required this.prediction,
  });

  predictioSet(String newPrediction) {
    prediction = newPrediction;
  }

  CreditsModels copyWith({
    String? interestRate,
    String? loanTerm,
    String? age,
    String? lieu,
    String? loanAmount,
    String? sexe,
    String? revenu,
    String? taux,
    String? loanNbr,
    String? logement,
    String? npaCharge,
    String? activiteSecondaire,
    String? nomcompte,
    String? codeagence,
    String? nomprenom,
    String? niveauetude,
    String? situationmatri,
    String? typecredit,
    String? secteurprof,
    String? catcredit,
    String? quotite,
    String? isEmployeeSahel,
    String? auteur,
    String? prediction,
  }) {
    return CreditsModels(
      interestRate: interestRate ?? this.interestRate,
      loanTerm: loanTerm ?? this.loanTerm,
      age: age ?? this.age,
      lieu: lieu ?? this.lieu,
      loanAmount: loanAmount ?? this.loanAmount,
      sexe: sexe ?? this.sexe,
      revenu: revenu ?? this.revenu,
      taux: taux ?? this.taux,
      loanNbr: loanNbr ?? this.loanNbr,
      logement: logement ?? this.logement,
      npaCharge: npaCharge ?? this.npaCharge,
      activiteSecondaire: activiteSecondaire ?? this.activiteSecondaire,
      nomcompte: nomcompte ?? this.nomcompte,
      codeagence: codeagence ?? this.codeagence,
      nomprenom: nomprenom ?? this.nomprenom,
      niveauetude: niveauetude ?? this.niveauetude,
      situationmatri: situationmatri ?? this.situationmatri,
      typecredit: typecredit ?? this.typecredit,
      secteurprof: secteurprof ?? this.secteurprof,
      catcredit: catcredit ?? this.catcredit,
      quotite: quotite ?? this.quotite,
      isEmployeeSahel: isEmployeeSahel ?? this.isEmployeeSahel,
      auteur: auteur ?? this.auteur,
      prediction: prediction ?? this.prediction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'interestRate': interestRate,
      'loanTerm': loanTerm,
      'age': age,
      'lieu': lieu,
      'loanAmount': loanAmount,
      'sexe': sexe,
      'revenu': revenu,
      'taux': taux,
      'loanNbr': loanNbr,
      'logement': logement,
      'npaCharge': npaCharge,
      'activiteSecondaire': activiteSecondaire,
      'nomcompte': nomcompte,
      'codeagence': codeagence,
      'nomprenom': nomprenom,
      'niveauetude': niveauetude,
      'situationmatri': situationmatri,
      'typecredit': typecredit,
      'secteurprof': secteurprof,
      'catcredit': catcredit,
      'quotite': quotite,
      'isEmployeeSahel': isEmployeeSahel,
      'auteur': auteur,
      'prediction': prediction,
    };
  }

  factory CreditsModels.fromMap(Map<String, dynamic> map) {
    return CreditsModels(
      interestRate: map['interestRate'] ?? '',
      loanTerm: map['loanTerm'] ?? '',
      age: map['age'] ?? '',
      lieu: map['lieu'] ?? '',
      loanAmount: map['loanAmount'] ?? '',
      sexe: map['sexe'] ?? '',
      revenu: map['revenu'] ?? '',
      taux: map['taux'] ?? '',
      loanNbr: map['loanNbr'] ?? '',
      logement: map['logement'] ?? '',
      npaCharge: map['npaCharge'] ?? '',
      activiteSecondaire: map['activiteSecondaire'] ?? '',
      nomcompte: map['nomcompte'] ?? '',
      codeagence: map['codeagence'] ?? '',
      nomprenom: map['nomprenom'] ?? '',
      niveauetude: map['niveauetude'] ?? '',
      situationmatri: map['situationmatri'] ?? '',
      typecredit: map['typecredit'] ?? '',
      secteurprof: map['secteurprof'] ?? '',
      catcredit: map['catcredit'] ?? '',
      quotite: map['quotite'] ?? '',
      isEmployeeSahel: map['isEmployeeSahel'] ?? '',
      auteur: map['auteur'] ?? '',
      prediction: map['prediction'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditsModels.fromJson(String source) =>
      CreditsModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreditsModels(interestRate: $interestRate, loanTerm: $loanTerm, age: $age, lieu: $lieu, loanAmount: $loanAmount, sexe: $sexe, revenu: $revenu, taux: $taux, loanNbr: $loanNbr, logement: $logement, npaCharge: $npaCharge, activiteSecondaire: $activiteSecondaire, nomcompte: $nomcompte, codeagence: $codeagence, nomprenom: $nomprenom, niveauetude: $niveauetude, situationmatri: $situationmatri, typecredit: $typecredit, secteurprof: $secteurprof, catcredit: $catcredit, quotite: $quotite, isEmployeeSahel: $isEmployeeSahel, auteur: $auteur, prediction: $prediction)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditsModels &&
        other.interestRate == interestRate &&
        other.loanTerm == loanTerm &&
        other.age == age &&
        other.lieu == lieu &&
        other.loanAmount == loanAmount &&
        other.sexe == sexe &&
        other.revenu == revenu &&
        other.taux == taux &&
        other.loanNbr == loanNbr &&
        other.logement == logement &&
        other.npaCharge == npaCharge &&
        other.activiteSecondaire == activiteSecondaire &&
        other.nomcompte == nomcompte &&
        other.codeagence == codeagence &&
        other.nomprenom == nomprenom &&
        other.niveauetude == niveauetude &&
        other.situationmatri == situationmatri &&
        other.typecredit == typecredit &&
        other.secteurprof == secteurprof &&
        other.catcredit == catcredit &&
        other.quotite == quotite &&
        other.isEmployeeSahel == isEmployeeSahel &&
        other.auteur == auteur &&
        other.prediction == prediction;
  }

  @override
  int get hashCode {
    return interestRate.hashCode ^
        loanTerm.hashCode ^
        age.hashCode ^
        lieu.hashCode ^
        loanAmount.hashCode ^
        sexe.hashCode ^
        revenu.hashCode ^
        taux.hashCode ^
        loanNbr.hashCode ^
        logement.hashCode ^
        npaCharge.hashCode ^
        activiteSecondaire.hashCode ^
        nomcompte.hashCode ^
        codeagence.hashCode ^
        nomprenom.hashCode ^
        niveauetude.hashCode ^
        situationmatri.hashCode ^
        typecredit.hashCode ^
        secteurprof.hashCode ^
        catcredit.hashCode ^
        quotite.hashCode ^
        isEmployeeSahel.hashCode ^
        auteur.hashCode ^
        prediction.hashCode;
  }
}
