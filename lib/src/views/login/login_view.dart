import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/core/app_fonts.dart';
import 'package:acad/src/core/app_images.dart';
import 'package:acad/src/views/login/login_viewmodel.dart';
import 'package:acad/src/widgets/button_widget.dart';
import 'package:acad/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (_, provider, __) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImagens.logo),
                    const SizedBox(height: 70),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Usuário',
                          style: AppFonts.text16Regular
                              .copyWith(color: AppColors.gray),
                        ),
                        const SizedBox(height: 6),
                        TextfieldWidget(
                          hintText: 'Informe o usuário',
                          textEditingController: provider.controllerUser,
                          erroTextVisible: provider.userHasError,
                          erroText: provider.userMessageError,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Senha',
                          style: AppFonts.text16Regular
                              .copyWith(color: AppColors.gray),
                        ),
                        const SizedBox(height: 6),
                        TextfieldWidget(
                          suffixIcon: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              provider.changedIsObscure();
                            },
                            child: provider.isObscure == false
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          hintText: 'Informe a senha',
                          textEditingController: provider.controllerPassword,
                          isObscure: provider.isObscure,
                          erroTextVisible: provider.passwordHasError,
                          erroText: provider.passwordMessageError,
                        ),
                      ],
                    ),
                    const SizedBox(height: 44),
                    BunttonWidget(
                      title: 'Acessar',
                      child: Visibility(
                        visible: provider.beLoading,
                        replacement: Text(
                          'Acessar',
                          style: AppFonts.text16Semibold
                              .copyWith(color: AppColors.white),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: LinearProgressIndicator(
                            color: AppColors.peachFury6,
                            backgroundColor: AppColors.peachFury4,
                          ),
                        ),
                      ),
                      onTap: () {
                        provider.checkUserSenha();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      provider.appVersionText,
                      style: AppFonts.text14Semibold
                          .copyWith(color: AppColors.grayText),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
