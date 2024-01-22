import 'dart:convert';

class AlunoNotaModel {
  final String nome;
  final int ano;
  final List<MatterModel> matter;
  final String? turma;

  AlunoNotaModel({
    required this.nome,
    required this.ano,
    required this.matter,
    this.turma,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'ano': ano,
      'matter': matter.map((x) => x.toMap()).toList(),
      'turma': turma,
    };
  }

  factory AlunoNotaModel.fromMap(Map<String, dynamic> map) {
    return AlunoNotaModel(
      nome: (map['nome'] ?? '').toString(),
      ano: (map['ano'] ?? 0) as int,
      matter: List<MatterModel>.from(
          map['matter']?.map((x) => MatterModel.fromMap(x))),
      turma: (map['turma'] ?? '').toString(),
    );
  }

  factory AlunoNotaModel.empty() => AlunoNotaModel(
        nome: '',
        ano: 0,
        turma: '',
        matter: [],
      );

  String toJson() => json.encode(toMap());

  factory AlunoNotaModel.fromJson(String source) =>
      AlunoNotaModel.fromMap(json.decode(source));
}

class MatterModel {
  final String materia;
  final int primeiroFalt;
  final int segundoFalt;
  final int terceiroFalt;
  final int quartoFalt;
  final int totalFalt;
  final String primeiroBi;
  final String segundoBi;
  final String terceiroBi;
  final String quartoBi;
  final String mediaFinal;
  final String media;
  final String? recuperacao;
  final String? conselho;

  MatterModel({
    required this.materia,
    required this.primeiroFalt,
    required this.segundoFalt,
    required this.terceiroFalt,
    required this.quartoFalt,
    required this.totalFalt,
    required this.primeiroBi,
    required this.segundoBi,
    required this.terceiroBi,
    required this.quartoBi,
    required this.mediaFinal,
    required this.media,
    this.recuperacao,
    this.conselho,
  });

  Map<String, dynamic> toMap() {
    return {
      'materia': materia,
      'primeiroFalt': primeiroFalt,
      'segundoFalt': segundoFalt,
      'terceiroFalt': terceiroFalt,
      'quartoFalt': quartoFalt,
      'totalFalt': totalFalt,
      'primeiroBi': primeiroBi,
      'segundoBi': segundoBi,
      'terceiroBi': terceiroBi,
      'quartoBi': quartoBi,
      'mediaFinal': mediaFinal,
      'media': media,
      'recuperacao': recuperacao,
      'conselho': conselho,
    };
  }

  factory MatterModel.fromMap(Map<String, dynamic> map) {
    return MatterModel(
      materia: (map['materia'] ?? '').toString(),
      primeiroFalt: (map['primeiroFalt'] ?? 0) as int,
      segundoFalt: (map['segundoFalt'] ?? 0) as int,
      terceiroFalt: (map['terceiroFalt'] ?? 0) as int,
      quartoFalt: (map['quartoFalt'] ?? 0) as int,
      totalFalt: (map['totalFalt'] ?? 0) as int,
      primeiroBi: (map['primeiroBi'] ?? '').toString(),
      segundoBi: (map['segundoBi'] ?? '').toString(),
      terceiroBi: (map['terceiroBi'] ?? '').toString(),
      quartoBi: (map['quartoBi'] ?? '').toString(),
      mediaFinal: (map['mediaFinal'] ?? '').toString(),
      media: (map['media'] ?? '').toString(),
      recuperacao: (map['recuperacao'] ?? '').toString(),
      conselho: (map['conselho'] ?? '').toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MatterModel.fromJson(String source) =>
      MatterModel.fromMap(json.decode(source));
}
