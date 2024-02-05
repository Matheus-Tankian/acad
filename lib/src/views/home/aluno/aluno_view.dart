import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/repository/perfil/perfil_repository.dart';
import 'package:sipaealuno/src/views/home/aluno/aluno_viewmodel.dart';
import 'package:sipaealuno/src/widgets/user_profile_widget.dart';

class AlunoView extends StatelessWidget {
  const AlunoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlunoViewModel>(
      create: (_) => AlunoViewModel(
        PerfilReposityImpl(),
      ),
      child: Consumer<AlunoViewModel>(
        builder: (_, provider, __) => Scaffold(
          body: Visibility(
            visible: provider.isLoading,
            replacement: const Center(
              child: CircularProgressIndicator(
                color: AppColors.peachFury5,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserProfile(
                    firtName: provider.firtName,
                    lastName: provider.lastName,
                    nome: provider.userPerfil.userName!,
                    email: provider.userPerfil.userEmail!,
                    telefone: provider.userPerfil.userTelefone!,
                    nivel: provider.userPerfil.userNivel!,
                    acess: provider.userPerfil.userAcesso!,
                    userImage: provider.userPerfil.userImage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
