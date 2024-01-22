import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sipaealuno/src/app.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/models/nova_senha/nova_senha_model.dart';
import 'package:sipaealuno/src/repository/nova_senha/nova_senha_repository.dart';
import 'package:sipaealuno/src/widgets/snack_bar_widget.dart';

class NewPasswordViewModel extends ChangeNotifier {
  final NovaSenhaReposity _novaSenhaReposity;
  bool _disposed = false;

  TextEditingController password = TextEditingController();

  TextEditingController newPassword = TextEditingController();

  bool _passworHasError = false;
  bool get passworHasError => _passworHasError;

  bool _newPassworHasError = false;
  bool get newPassworHasError => _newPassworHasError;

  bool _updatePasswor = true;
  bool get updatePasswor => _updatePasswor;

  bool _dataIsValid = false;
  bool get dataIsValid => _dataIsValid;

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  bool _isObscurePassword = true;
  bool get isObscurePassword => _isObscurePassword;

  String _passwordErrorMessage = "";
  String get passwordErrorMessage => _passwordErrorMessage;

  String _userName = '';
  String get userName => _userName;

  String _newPasswordErrorMessage = '';
  String get newPasswordErrorMessage => _newPasswordErrorMessage;

  NewPasswordViewModel(this._novaSenhaReposity);

  void changeUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  void changePasswordErrorMessage(String value) {
    _passwordErrorMessage = value;
    notifyListeners();
  }

  void changeNewPasswordErrorMessage(String value) {
    _newPasswordErrorMessage = value;
    notifyListeners();
  }

  void changeIsObscurePassword() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }

  void changeIsObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void changePassworHasError(bool value) {
    _passworHasError = value;
    notifyListeners();
  }

  void changeNewPassworHasError(bool value) {
    _newPassworHasError = value;
    notifyListeners();
  }

  void changeUpdatePasswor(bool value) {
    _updatePasswor = value;
    notifyListeners();
  }

  void changeDataIsValid(bool value) async {
    _dataIsValid = value;
    notifyListeners();
  }

  void showPasswordError(bool value) {
    changePassworHasError(value);
    changeNewPassworHasError(value);
  }

  void showSnackbar(String title, bool erro) {
    showSnackBarMessage(
      navigationApp.currentContext!,
      message: title,
      backgroundColor: erro ? AppColors.red : AppColors.green,
      duration: const Duration(seconds: 2),
    );
  }

  void checkTextIsEmptyError() {
    if (password.text.isEmpty) {
      changePassworHasError(true);
      changePasswordErrorMessage("O campo está vazio");
    } else {
      changePassworHasError(false);
    }

    if (newPassword.text.isEmpty) {
      changeNewPassworHasError(true);
      changeNewPasswordErrorMessage('Ocampo está vazio');
    } else {
      changeNewPassworHasError(false);
    }
  }

  void checkTextIsIqualError() {
    if ((password.text.toLowerCase() != newPassword.text.toLowerCase()) &&
        (password.text.length >= 5 && newPassword.text.length >= 5)) {
      showPasswordError(true);
      changePasswordErrorMessage("Os dados infromados não são iguais");
      changeNewPasswordErrorMessage("Os dados infromados não são iguais");
    } else {
      if (password.text.length < 5) {
        changePassworHasError(true);
        changePasswordErrorMessage("A senha e muito curta");
      } else {
        changePassworHasError(false);
      }

      if (newPassword.text.length < 5) {
        changeNewPassworHasError(true);
        changeNewPasswordErrorMessage("A senha e muito curta");
      } else {
        changeNewPassworHasError(false);
      }
    }
  }

  Future<void> validatePassword() async {
    if (password.text.isEmpty || newPassword.text.isEmpty) {
      checkTextIsEmptyError();
      changeDataIsValid(false);
      showSnackbar('Por favor, preencha todos os campos.', true);
    } else if ((password.text.toLowerCase() ==
            newPassword.text.toLowerCase()) &&
        (password.text.length >= 5 && newPassword.text.length >= 5)) {
      showPasswordError(false);
      changeUpdatePasswor(false);
      // await sendNovaSenha(userName, password.text);
      changeDataIsValid(true);
      await Future.delayed(const Duration(seconds: 1));
      changeUpdatePasswor(true);
      showSnackbar('Senha atualizada com sucesso', false);
    } else {
      checkTextIsIqualError();
      changeDataIsValid(false);
      showSnackbar('Os dados informados não são validos', true);
    }
  }

  Future<void> sendNovaSenha(
    String nome,
    String senha,
  ) async {
    NovaSenhaModel nova = NovaSenhaModel(nome: nome, senha: senha);
    try {
      await _novaSenhaReposity.postNovaSenha(nova);
      changeDataIsValid(true);
      changeUpdatePasswor(true);
      showSnackbar('Senha atualizada com sucesso', false);
    } catch (e) {
      showSnackbar('Error $e', true);
      log('Erro $e');
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
