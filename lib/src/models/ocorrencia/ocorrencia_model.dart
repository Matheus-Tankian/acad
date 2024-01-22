import 'dart:convert';

class OcorrenciaModel {
  final String aluno;
  final int id;
  final String tipo;
  final String data;
  final String sala;
  final String descricao;

  OcorrenciaModel({
    required this.aluno,
    required this.id,
    required this.tipo,
    required this.data,
    required this.sala,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'aluno': aluno,
      'id': id,
      'tipo': tipo,
      'data': data,
      'sala': sala,
      'descricao': descricao,
    };
  }

  factory OcorrenciaModel.fromMap(Map<String, dynamic> map) {
    return OcorrenciaModel(
      aluno: (map['aluno'] ?? '').toString(),
      id: (map['id'] ?? 0) as int,
      tipo: (map['tipo'] ?? '').toString(),
      data: (map['data'] ?? '').toString(),
      sala: (map['sala'] ?? '').toString(),
      descricao: (map['descricao'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OcorrenciaModel.fromJson(String source) =>
      OcorrenciaModel.fromMap(json.decode(source));
}
