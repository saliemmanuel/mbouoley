import 'dart:convert';

class Utilisateur {
  final String? id;
  final String? pseudo;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? grade;
  final bool? statut;
  Utilisateur({
    this.id,
    this.pseudo,
    this.nom,
    this.prenom,
    this.email,
    required this.grade,
    this.statut,
  });

  Utilisateur copyWith({
    String? id,
    String? pseudo,
    String? nom,
    String? prenom,
    String? email,
    String? grade,
    bool? statut,
  }) {
    return Utilisateur(
      id: id ?? this.id,
      pseudo: pseudo ?? this.pseudo,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      grade: grade ?? this.grade,
      statut: statut ?? this.statut,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pseudo': pseudo,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'grade': grade,
      'statut': statut,
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      id: map['id'],
      pseudo: map['pseudo'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      grade: map['grade'],
      statut: map['statut'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Utilisateur.fromJson(String source) =>
      Utilisateur.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Utilisateur(id: $id, pseudo: $pseudo, nom: $nom, prenom: $prenom, email: $email, grade: $grade, statut: $statut)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Utilisateur &&
        other.id == id &&
        other.pseudo == pseudo &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.email == email &&
        other.grade == grade &&
        other.statut == statut;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pseudo.hashCode ^
        nom.hashCode ^
        prenom.hashCode ^
        email.hashCode ^
        grade.hashCode ^
        statut.hashCode;
  }
}
