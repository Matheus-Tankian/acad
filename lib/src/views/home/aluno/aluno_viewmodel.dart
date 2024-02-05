import 'dart:developer';

import 'package:acad/src/models/perfil/perfil_model.dart';
import 'package:acad/src/repository/perfil/perfil_repository.dart';
import 'package:flutter/material.dart';

class AlunoViewModel extends ChangeNotifier {
  final PerfilReposity _perfilReposity;
  bool _disposed = false;

  String _firtName = '';
  String get firtName => _firtName;

  String _lastName = '';
  String get lastName => _lastName;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PerfilModel _userPerfil = PerfilModel.empty();
  PerfilModel get userPerfil => _userPerfil;

  AlunoViewModel(this._perfilReposity) {
    loadingPage();
  }

  void changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> changeUserPerfil(PerfilModel value) async {
    _userPerfil = value;

    notifyListeners();
  }

  Future<PerfilModel> getAllPerfil() async {
    final result = await _perfilReposity.getPerfil();

    await changeUserPerfil(result);
    return result;
  }

  Future<void> loadingPage() async {
    try {
      await getAllPerfil();
      await Future.delayed(const Duration(seconds: 1));

      await userName(_userPerfil.userName!);
    } catch (e) {
      log('Ocorreu um erro: $e');
    } finally {
      changeIsLoading(true);
    }
  }

  Future<void> userName(String value) async {
    List<String> nome = value.split(" ");

    _firtName = nome.isNotEmpty ? nome.first : '';
    _lastName = nome.isNotEmpty ? nome.last : '';
    notifyListeners();
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
