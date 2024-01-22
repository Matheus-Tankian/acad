import 'dart:convert';

class EscolaModel {
  final int idEscola;
  final String escola;

  EscolaModel({
    required this.idEscola,
    required this.escola,
  });

  Map<String, dynamic> toMap() {
    return {
      'idEscola': idEscola,
      'escola': escola,
    };
  }

  factory EscolaModel.fromMap(Map<String, dynamic> map) {
    return EscolaModel(
      idEscola: (map['idEscola'] ?? 0),
      escola: (map['escola'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory EscolaModel.fromJson(String source) =>
      EscolaModel.fromMap(json.decode(source));
}
