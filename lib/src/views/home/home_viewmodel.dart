import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sipaealuno/src/app.dart';
import 'package:sipaealuno/src/models/city/city_model.dart';
import 'package:sipaealuno/src/models/horario/horario_model.dart';
import 'package:sipaealuno/src/models/noticia/noticia_model.dart';
import 'package:sipaealuno/src/models/perfil/perfil_model.dart';
import 'package:sipaealuno/src/repository/city/city_repository.dart';
import 'package:sipaealuno/src/repository/horario.dart/horario_repository.dart';
import 'package:sipaealuno/src/repository/noticia/noticia_repository.dart';
import 'package:sipaealuno/src/repository/perfil/perfil_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final CityReposity _cityReposity;
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
    this._cityReposity,
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
      "/login",
      (route) => false,
    );
  }

  Future<void> loadPage() async {
    changeLoad(true);
    try {
      await getPreviaNews();
      await getHorario();
      await getAllCities();
      await getAllPerfil();
    } catch (e) {
      log('Erro durante a carga de dados: $e');
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

  Future<List<CityModel>> getAllCities() async {
    final result = await _cityReposity.getAllCities();

    //for (final value in result) {
    // log('ID: ${value.id}');
    // log('Cidade: ${value.cidade}');
    // log('URL: ${value.url}');
    // log('====================');
    //}

    return result.toList();
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
