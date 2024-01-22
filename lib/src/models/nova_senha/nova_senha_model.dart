import 'dart:convert';

class NovaSenhaModel {
  final String nome;
  final String senha;

  NovaSenhaModel({
    required this.nome,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'senha': senha,
    };
  }

  factory NovaSenhaModel.fromMap(Map<String, dynamic> map) {
    return NovaSenhaModel(
      nome: (map['senha'] ?? '').toString(),
      senha: (map['senha'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NovaSenhaModel.fromJson(String source) =>
      NovaSenhaModel.fromMap(json.decode(source));
}
