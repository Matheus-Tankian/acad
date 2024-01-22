import 'dart:convert';

class DiaModel {
  final String dia;
  final List<HorarioModel> horarios;

  DiaModel({
    required this.dia,
    required this.horarios,
  });

  Map<String, dynamic> toMap() {
    return {
      'dia': dia,
      'horarios': horarios.map((x) => x.toMap()).toList(),
    };
  }

  factory DiaModel.fromMap(Map<String, dynamic> map) {
    return DiaModel(
      dia: (map['dia'] ?? '').toString(),
      horarios: List<HorarioModel>.from(
          map['horarios']?.map((x) => HorarioModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiaModel.fromJson(String source) =>
      DiaModel.fromMap(json.decode(source));
}

class HorarioModel {
  final String horaInicial;
  final String horaFinal;
  final String materia;
  final String nomeProfessor;

  HorarioModel({
    required this.horaInicial,
    required this.horaFinal,
    required this.materia,
    required this.nomeProfessor,
  });

  Map<String, dynamic> toMap() {
    return {
      'horaInicial': horaInicial,
      'horaFinal': horaFinal,
      'materia': materia,
      'nomeProfessor': nomeProfessor,
    };
  }

  factory HorarioModel.fromMap(Map<String, dynamic> map) {
    return HorarioModel(
      horaInicial: (map['horaInicial'] ?? '').toString(),
      horaFinal: (map['horaFinal'] ?? '').toString(),
      materia: (map['materia'] ?? '').toString(),
      nomeProfessor: (map['nomeProfessor'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory HorarioModel.fromJson(String source) =>
      HorarioModel.fromMap(json.decode(source));
}
