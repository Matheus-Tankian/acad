import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/repository/nova_senha/nova_senha_repository.dart';
import 'package:sipaealuno/src/views/home/aluno/new_password/new_password_viewmodel.dart';
import 'package:sipaealuno/src/widgets/textfield_widget.dart';
import 'package:sipaealuno/src/widgets/user_profile_widget.dart';

class NewPasswordView extends StatefulWidget {
  final String nome;

  const NewPasswordView({
    super.key,
    required this.nome,
  });

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewPasswordViewModel>(
      create: (_) => NewPasswordViewModel(
        NovaSenhaReposityImpl(),
      ),
      child: Consumer<NewPasswordViewModel>(
        builder: (_, provider, __) => SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.peachFury2,
            body: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 2,
              ),
              child: Visibility(
                visible: provider.updatePasswor,
                replacement: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.peachFury5,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Editar Senha',
                        style: AppFonts.text32Semibold,
                      ),
                      const SizedBox(height: 14),
                      Userdata(
                        label: 'Nome',
                        nome: widget.nome,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Senha',
                            style: AppFonts.text16Regular,
                          ),
                          const SizedBox(height: 10),
                          TextfieldWidget(
                              suffixIcon: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  provider.changeIsObscurePassword();
                                },
                                child: provider.isObscurePassword == false
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                              isObscure: provider.isObscurePassword,
                              hintText: 'Informe a senha',
                              textEditingController: provider.password,
                              beBackgroundColor: true,
                              backgroundColor: AppColors.white,
                              erroTextVisible: provider.passworHasError,
                              erroText: provider.passwordErrorMessage),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirmar a senha',
                            style: AppFonts.text16Regular,
                          ),
                          const SizedBox(height: 10),
                          TextfieldWidget(
                            suffixIcon: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                provider.changeIsObscure();
                              },
                              child: provider.isObscure == false
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            isObscure: provider.isObscure,
                            hintText: 'Informe a senha novamente',
                            textEditingController: provider.newPassword,
                            beBackgroundColor: true,
                            backgroundColor: AppColors.white,
                            erroTextVisible: provider.newPassworHasError,
                            erroText: provider.newPasswordErrorMessage,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancelar',
                                  style: AppFonts.text16Semibold
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () async {
                              provider.changeUserName(widget.nome);
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              await provider.validatePassword();
                              if (provider.dataIsValid == true) {
                                provider.password.clear();
                                provider.newPassword.clear();
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Atualizar',
                                  style: AppFonts.text16Semibold
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
