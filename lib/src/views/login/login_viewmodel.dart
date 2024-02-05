import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sipaealuno/src/app.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/models/auth/auth_request_model.dart';
import 'package:sipaealuno/src/models/city/city_model.dart';
import 'package:sipaealuno/src/repository/auth/auth_repository.dart';
import 'package:sipaealuno/src/repository/city/city_repository.dart';
import 'package:sipaealuno/src/utils/api_urls.dart';
import 'package:sipaealuno/src/utils/hive_box.dart';
import 'package:sipaealuno/src/widgets/snack_bar_widget.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final CityReposity _cityReposity;

  bool _disposed = false;

  final controllerUser = TextEditingController();
  final controllerPassword = TextEditingController();

  bool _userHasError = false;
  bool get userHasError => _userHasError;

  bool _passwordHasError = false;
  bool get passwordHasError => _passwordHasError;

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  String _userMessageError = '';
  String get userMessageError => _userMessageError;

  String _passwordMessageError = '';
  String get passwordMessageError => _passwordMessageError;

  bool _beLoading = false;
  bool get beLoading => _beLoading;

  String _appVersionText = '';
  String get appVersionText => _appVersionText;

  String _city = '';
  String get city => _city;

  String _cityUrl = '';
  String get cityUrl => _cityUrl;

  List<String> _citys = [];
  List<String> get citys => _citys;

  List<CityModel> _cityList = [];
  List<CityModel> get cityList => _cityList;

  bool _hasErrorCity = false;
  bool get hasErrorCity => _hasErrorCity;

  LoginViewModel(
    this._authRepository,
    this._cityReposity,
  ) {
    loadPage();
  }

  Future<void> loadPage() async {
    appVersion();
    await getAllCities();
  }

  void changeCityUrl(String value) {
    _cityUrl = value;
    notifyListeners();
  }

  void changeHasErrorCity(bool value) {
    _hasErrorCity = value;
    notifyListeners();
  }

  void changeAppVersionText(String value) {
    _appVersionText = value;
    notifyListeners();
  }

  void changeBeLoading(bool value) {
    _beLoading = value;
    notifyListeners();
  }

  void changedIsObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void changeUserHasError(bool value) {
    _userHasError = value;
    notifyListeners();
  }

  void changePasswordHasError(bool value) {
    _passwordHasError = value;
    notifyListeners();
  }

  void changeUserMessageError(String value) {
    _userMessageError = value;
    changeUserHasError(true);
    notifyListeners();
  }

  void changePasswordMessageError(String value) {
    _passwordMessageError = value;
    changePasswordHasError(true);
    notifyListeners();
  }

  void showSnackbar({
    required String title,
    required bool erro,
    int? time,
  }) {
    showSnackBarMessage(
      navigationApp.currentContext!,
      message: title,
      backgroundColor: erro ? AppColors.red : AppColors.green,
      duration: Duration(seconds: time ?? 2),
    );
  }

  void checkEmptyText() {
    if (controllerUser.text.isEmpty) {
      changeUserMessageError('O campo está vazio');
    } else {
      changeUserHasError(false);
    }
    if (controllerPassword.text.isEmpty) {
      changePasswordMessageError('O campo está vazio');
    } else {
      changePasswordHasError(false);
    }
  }

  void invalidCredential() {
    changeUserMessageError('Credencial invalida');
    changePasswordMessageError('Credencial invalida');
  }

  void changeCity(String value) {
    if (_city != value) {
      _city = value;
      for (final items in _cityList) {
        if (items.cidade!.toLowerCase().toString() ==
            value.toLowerCase().toString()) {
          changeCityUrl(items.url!);
        }
      }
      notifyListeners();
    }
  }

  void changeCitysText(List<String> value) {
    _citys = value;
    notifyListeners();
  }

  void changeCityList(List<CityModel> value) {
    _cityList = value;
    notifyListeners();
  }

  void addCityText() {
    List<String> temp = [];
    for (final value in _cityList) {
      temp.add(value.cidade!);
    }
    changeCitysText(temp);
  }

  Future<void> tryLogin(AuthRequestModel authRequest) async {
    try {
      final result =
          await _authRepository.authenticate(authRequest, baseUrl, _cityUrl);

      final authBox = Hive.box(hiveAuthBoxName);
      await authBox.put(hiveAuthBoxKey, result.toJson());
      var box = await Hive.openBox(hiveBoxCityUrl);
      await box.put('url', _cityUrl);

      Navigator.pushNamedAndRemoveUntil(
        navigationApp.currentContext!,
        "/",
        (route) => false,
      );

      showSnackbar(
        title: 'Login realizado com sucesso.',
        erro: false,
      );
      changeBeLoading(false);
    } catch (e) {
      changeBeLoading(false);
      showSnackbar(
        title: 'Credenciais invalidas.',
        erro: true,
      );
      log('Error $e');
    }
  }

  Future<void> goToHome() async {
    if (controllerUser.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
      changeUserHasError(false);
      changePasswordHasError(false);
      changeHasErrorCity(false);

      changeBeLoading(true);
      AuthRequestModel aux = AuthRequestModel(
        user: controllerUser.text,
        password: controllerPassword.text,
      );
      tryLogin(aux);
    }
  }

  Future<void> checkUserSenha() async {
    if (controllerUser.text.isEmpty ||
        controllerPassword.text.isEmpty ||
        _cityUrl.isEmpty) {
      showSnackbar(
        title: 'Por favor, preencha todos os campos.',
        erro: true,
      );
      checkEmptyText();
      return;
    }

    //quando tiver a api fazer os erros da api
    if (controllerUser.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
      await goToHome();
    } else {
      invalidCredential();
      showSnackbar(
        title: 'Usuario ou senha esão errado.',
        erro: true,
      );
    }
  }

  Future<void> appVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    changeAppVersionText(packageInfo.version);
  }

  Future<void> checkCity() async {
    if (_city == '') {
      changeHasErrorCity(true);
    }
  }

  Future<List<CityModel>> getAllCities() async {
    try {
      final result = await _cityReposity.getAllCities();

      changeCityList(result);
      addCityText();

      return result.toList();
    } catch (e) {
      showSnackbar(
        title: 'Falha ao carregar os dados, verifique sua conexão!',
        erro: true,
        time: 4,
      );
      return [];
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
