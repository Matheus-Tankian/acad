import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/views/home/aluno/new_password/new_password_view.dart';
import 'package:sipaealuno/src/widgets/button_widget.dart';
import 'package:sipaealuno/src/widgets/perfil_widget.dart';

class UserProfile extends StatelessWidget {
  final String nome;
  final String firtName;
  final String lastName;
  final String email;
  final String telefone;
  final String nivel;
  final String acess;
  final double? height;

  const UserProfile({
    super.key,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.nivel,
    required this.acess,
    required this.firtName,
    required this.lastName,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    String ddd = telefone.substring(0, 2);
    String prefixo = telefone.substring(2, 7);
    String sufixo = telefone.substring(7, 11);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.only(left: 22),
            color: AppColors.peachFury5,
            child: PerfilWidget(
              nome: '$firtName $lastName',
              infoText: nivel,
              avatarSize: 70,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 34,
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perfil',
                    style: AppFonts.text32Semibold,
                  ),
                  const SizedBox(height: 12),
                  Userdata(
                    label: 'Nome',
                    nome: nome,
                  ),
                  const SizedBox(height: 15),
                  Userdata(
                    label: 'E-mail',
                    nome: email,
                  ),
                  const SizedBox(height: 15),
                  Userdata(
                    label: 'Telefone',
                    nome: "($ddd) $prefixo-$sufixo",
                  ),
                  const SizedBox(height: 15),
                  Userdata(
                    label: 'Nivel do acesso',
                    nome: nivel,
                  ),
                  const SizedBox(height: 15),
                  Userdata(
                    label: 'Ult. Acesso',
                    nome: acess,
                  ),
                  const SizedBox(height: 40),
                  BunttonWidget(
                    paddingButton: const EdgeInsets.symmetric(vertical: 16),
                    title: 'Editar Senha',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPasswordView(
                            nome: nome,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Userdata extends StatelessWidget {
  final String label;
  final String nome;

  const Userdata({
    super.key,
    required this.label,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.text16Regular,
        ),
        const SizedBox(height: 10),
        Text(
          nome,
          style: AppFonts.text18Semibold,
        ),
      ],
    );
  }
}
