import 'dart:developer';

import 'package:acad/src/app.dart';
import 'package:acad/src/models/horario/horario_model.dart';
import 'package:acad/src/models/noticia/noticia_model.dart';
import 'package:acad/src/models/perfil/perfil_model.dart';
import 'package:acad/src/repository/horario.dart/horario_repository.dart';
import 'package:acad/src/repository/noticia/noticia_repository.dart';
import 'package:acad/src/repository/perfil/perfil_repository.dart';
import 'package:acad/src/utils/cache_repository.dart';
import 'package:acad/src/utils/hive_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class HomeViewModel extends ChangeNotifier {
  final NoticiaReposity _noticiaReposity;
  final DiaReposity _diaReposity;
  final PerfilReposity _perfilReposity;
  bool _disposed = false;

  List<DiaModel> _horariosList = [];
  List<DiaModel> get horariosList => _horariosList;

  List<NoticiaModel> _noticicasList = [];
  List<NoticiaModel> get noticicasList => _noticicasList;

  bool _load = false;
  bool get load => _load;

  PerfilModel _userPerfil = PerfilModel.empty();
  PerfilModel get userPerfil => _userPerfil;

  HomeViewModel(
    this._noticiaReposity,
    this._diaReposity,
    this._perfilReposity,
  ) {
    loadPage();
  }

  void changeLoad(bool value) {
    _load = value;

    notifyListeners();
  }

  void changeNoticias(List<NoticiaModel> value) async {
    _noticicasList = value;
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

  Future<void> exitApp() async {
    await Navigator.pushNamedAndRemoveUntil(
      navigationApp.currentContext!,
      "/",
      (route) => false,
    );
  }

  Future<void> clearAllBoxes() async {
    await HiveCache(Hive.box(hiveAuthBoxName)).clearCache();
    await Hive.box(hiveBoxCityUrl).clear();
  }

  Future<void> loadPage() async {
    changeLoad(true);
    try {
      await getAllPerfil();
      await getPreviaNews();
      await getHorario();
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      log('Erro durante a carga de dados home page: $e');
    } finally {
      changeLoad(false);
    }
  }

  void changeHorariosList(List<DiaModel> value) {
    _horariosList = value;
    notifyListeners();
  }

  Future<List<DiaModel>> getHorario() async {
    final result = await _diaReposity.getAllHorario();

    changeHorariosList(result);

    return result;
  }

  Future<List<NoticiaModel>> getPreviaNews() async {
    final result = await _noticiaReposity.getAllNoticias();

    changeNoticias(result);

    return result;
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
