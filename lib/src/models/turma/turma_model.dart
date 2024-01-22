import 'dart:convert';

class TurmaModel {
  final int idTurma;
  final String turma;

  TurmaModel({
    required this.idTurma,
    required this.turma,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTurma': idTurma,
      'turma': turma,
    };
  }

  factory TurmaModel.fromMap(Map<String, dynamic> map) {
    return TurmaModel(
      idTurma: (map['idTurma'] ?? 0) as int,
      turma: (map['turma'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TurmaModel.fromJson(String source) =>
      TurmaModel.fromMap(json.decode(source));
}
