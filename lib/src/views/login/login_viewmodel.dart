import 'package:flutter/material.dart';
import 'package:sipaealuno/src/app.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/widgets/snack_bar_widget.dart';

class LoginViewModel extends ChangeNotifier {
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

  bool _disposed = false;

  LoginViewModel();

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

  void showSnackbar(String title, bool erro) {
    showSnackBarMessage(
      navigationApp.currentContext!,
      message: title,
      backgroundColor: erro ? AppColors.red : AppColors.green,
      duration: const Duration(seconds: 2),
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

  Future<void> goToHome() async {
    if (controllerUser.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
      changeUserHasError(false);
      changePasswordHasError(false);

      changeBeLoading(true);
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamedAndRemoveUntil(
        navigationApp.currentContext!,
        "/home",
        (route) => false,
      );
      changeBeLoading(false);
      showSnackbar('Login realizado com sucesso.', false);
      controllerPassword.clear();
      controllerUser.clear();
    }
  }

  Future<void> checkUserSenha() async {
    if (controllerUser.text.isEmpty || controllerPassword.text.isEmpty) {
      showSnackbar('Por favor, preencha todos os campos.', true);
      checkEmptyText();
      return;
    }

    //quando tiver a api fazer os erros da api
    if (controllerUser.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
      await goToHome();
    } else {
      invalidCredential();
      showSnackbar('Usuario ou senha esão errado.', true);
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
