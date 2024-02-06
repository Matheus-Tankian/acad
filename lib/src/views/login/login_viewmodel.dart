import 'dart:developer';

import 'package:acad/src/app.dart';
import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginViewModel extends ChangeNotifier {
  //final AuthRepository _authRepository;

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

  LoginViewModel() {
    loadPage();
  }

  Future<void> loadPage() async {
    appVersion();
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

  Future<void> tryLogin() async {
    //era o o parametro: AuthRequestModel authRequest
    try {
      // final result =
      //     await _authRepository.authenticate(authRequest, baseUrl, _cityUrl);

      // final authBox = Hive.box(hiveAuthBoxName);
      // await authBox.put(hiveAuthBoxKey, result.toJson());
      // var box = await Hive.openBox(hiveBoxCityUrl);
      // await box.put('url', _cityUrl);

      Navigator.pushNamedAndRemoveUntil(
        navigationApp.currentContext!,
        "/home",
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

      changeBeLoading(true);
      // AuthRequestModel aux = AuthRequestModel(
      //   user: controllerUser.text,
      //   password: controllerPassword.text,
      // );
      tryLogin();
    }
  }

  Future<void> checkUserSenha() async {
    if (controllerUser.text.isEmpty || controllerPassword.text.isEmpty) {
      showSnackbar(
        title: 'Por favor, preencha todos os campos.',
        erro: true,
      );
      checkEmptyText();
      return;
    }

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
