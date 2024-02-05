import 'dart:developer';

import 'package:acad/src/models/ocorrencia/ocorrencia_model.dart';
import 'package:acad/src/repository/ocorrencia/ocorrencia_repository.dart';
import 'package:flutter/material.dart';

class OcorrenciaViewModel extends ChangeNotifier {
  final OcorrenciaReposity _ocorrenciaReposity;
  bool _disposed = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<OcorrenciaModel> _listOccurrences = [];
  List<OcorrenciaModel> get listOccurrences => _listOccurrences;

  OcorrenciaViewModel(this._ocorrenciaReposity) {
    checkValues();
  }

  void changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void changeListOccurrences(List<OcorrenciaModel> value) {
    _listOccurrences = value;
    notifyListeners();
  }

  Future<List<OcorrenciaModel>> getAllOcorencias() async {
    final result = await _ocorrenciaReposity.getAllOcorrencias();
    changeListOccurrences(result);
    return result;
  }

  Future<void> checkValues() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await getAllOcorencias();
    } catch (e) {
      log('Erro durante a carga de dados ocorrencias: $e');
    } finally {
      changeIsLoading(true);
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
