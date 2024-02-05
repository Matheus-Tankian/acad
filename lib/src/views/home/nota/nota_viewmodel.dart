import 'dart:developer';

import 'package:acad/src/models/Escola/escola_model.dart';
import 'package:acad/src/models/materia/materia_model.dart';
import 'package:acad/src/models/turma/turma_model.dart';
import 'package:acad/src/repository/escola/escola_repository.dart';
import 'package:acad/src/repository/materia/materia_repository.dart';
import 'package:acad/src/repository/turma/turma_repository.dart';
import 'package:flutter/material.dart';

class NotaViewModel extends ChangeNotifier {
  final TurmaReposity _turmaReposity;
  final EscolaReposity _escolaReposity;
  final MateriaReposity _materiaReposity;
  bool _disposed = false;

  List<MatterModel> _notas = [];
  List<MatterModel> get notas => _notas;

  String _escola = '';
  String get escola => _escola;

  String _turma = '';
  String get turma => _turma;

  bool _loadMatter = true;
  bool get loadMatter => _loadMatter;

  bool _hasSchool = false;
  bool get hasSchool => _hasSchool;

  String _nomeAluno = '';
  String get nomeAluno => _nomeAluno;

  String _ano = '';
  String get ano => _ano;

  String _turmaEncontrada = '';
  String get turmaEncontrada => _turmaEncontrada;

  List<String> _escolas = [];
  List<String> get escolas => _escolas;

  List<EscolaModel> _escolaList = [];
  List<EscolaModel> get escolaList => _escolaList;

  List<String> _turmas = [];
  List<String> get turmas => _turmas;

  List<TurmaModel> _turmaList = [];
  List<TurmaModel> get turmaList => _turmaList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  NotaViewModel(
    this._turmaReposity,
    this._escolaReposity,
    this._materiaReposity,
  ) {
    loading();
  }

  void changeTurmaList(List<TurmaModel> value) {
    _turmaList = value;
    notifyListeners();
  }

  void changeEscolaList(List<EscolaModel> value) {
    _escolaList = value;
    notifyListeners();
  }

  void changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void changeNomeAluno(String value) {
    _nomeAluno = value;
    notifyListeners();
  }

  void chageAno(String value) {
    _ano = value;
    notifyListeners();
  }

  void changeTurmaEncontrada(String value) {
    _turmaEncontrada = value;
    notifyListeners();
  }

  void changeHasSchool(bool value) {
    _hasSchool = value;
    notifyListeners();
  }

  void changeLoadMatter(bool value) {
    _loadMatter = value;
    notifyListeners();
  }

  void changeEscola(String value) {
    if (_escola != value) {
      _escola = value;
      checkMatter();
      notifyListeners();
    }
  }

  void changeTurma(String value) {
    if (_turma != value) {
      _turma = value;
      checkMatter();
      notifyListeners();
    }
  }

  void checkMatter() {
    changeHasSchool(false);

    if (_escola.isNotEmpty && _turma.isNotEmpty) {
      changeHasSchool(true);

      int idEscola =
          escolaList.firstWhere((esc) => esc.escola == _escola).idEscola;

      int idTurma = turmaList.firstWhere((tur) => tur.turma == _turma).idTurma;

      changeNotas(idEscola, idTurma);
    }
  }

  void changeTurmasText(List<String> value) {
    _turmas = value;
    notifyListeners();
  }

  void changeEscolasText(List<String> value) {
    _escolas = value;
    notifyListeners();
  }

  void addTurmaText() {
    List<String> temp = [];
    for (final value in _turmaList) {
      temp.add(value.turma);
    }
    changeTurmasText(temp);
  }

  void addEscolaText() {
    List<String> temp = [];
    for (final value in _escolaList) {
      temp.add(value.escola);
    }
    changeEscolasText(temp);
  }

  Future<void> loading() async {
    await getAllTurmas();
    await getAllEscolas();
    await Future.delayed(const Duration(seconds: 1));
    changeIsLoading(true);
  }

  Future<AlunoNotaModel> getAlunoNota(int idEscola, int idTurma) async {
    final result = await _materiaReposity.getAllMaterias(idEscola, idTurma);
    changeNomeAluno(result.nome);
    chageAno(result.ano.toString());
    // changeTurmaEncontrada(result.turma!);

    await getMaterias(result.matter);

    return result;
  }

  Future<void> getMaterias(List<MatterModel> value) async {
    List<MatterModel> auxList = [];
    for (final i in value) {
      auxList.add(i);
    }
    _notas = auxList;
    notifyListeners();
  }

  Future<List<TurmaModel>> getAllTurmas() async {
    final result = await _turmaReposity.getAllTurmas();
    changeTurmaList(result);
    addTurmaText();
    return result;
  }

  Future<List<EscolaModel>> getAllEscolas() async {
    final result = await _escolaReposity.getAllEscolas();
    changeEscolaList(result);
    addEscolaText();
    return result;
  }

  Future<void> changeNotas(int idEscola, int idTurma) async {
    changeLoadMatter(true);
    try {
      changeTurmaEncontrada(_turma);
      await getAlunoNota(idEscola, idTurma);
      await Future.delayed(const Duration(seconds: 1));
      changeLoadMatter(false);
    } catch (e) {
      log('Ocorreu um erro: $e');
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
