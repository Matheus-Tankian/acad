import 'package:acad/src/app.dart';
import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/core/app_fonts.dart';
import 'package:acad/src/core/app_icons.dart';
import 'package:acad/src/repository/horario.dart/horario_repository.dart';
import 'package:acad/src/repository/noticia/noticia_repository.dart';
import 'package:acad/src/repository/perfil/perfil_repository.dart';
import 'package:acad/src/views/home/home_viewmodel.dart';
import 'package:acad/src/views/home/noticia/noticia_view.dart';
import 'package:acad/src/widgets/alertdialog.dart';
import 'package:acad/src/widgets/horario_widget.dart';
import 'package:acad/src/widgets/news_widget.dart';
import 'package:acad/src/widgets/perfil_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(
        NoticiaReposityImpl(),
        DiaReposityImpl(),
        PerfilReposityImpl(),
      ),
      child: Consumer<HomeViewModel>(
        builder: (_, provider, __) => Visibility(
          visible: provider.load == false,
          replacement: const Center(
              child: CircularProgressIndicator(
            color: AppColors.peachFury5,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  color: AppColors.peachFury5,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            alertMessage(context, () {
                              Navigator.of(navigationApp.currentContext!,
                                      rootNavigator: true)
                                  .pop();

                              provider.clearAllBoxes();
                              provider.exitApp();
                            });
                          },
                          child: SvgPicture.asset(
                            AppIcons.exit,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      PerfilWidget(
                        imgPerfil: provider.userPerfil.userImage,
                        nome: provider.userPerfil.userName!.split(' ')[0],
                        avatarSize: 70,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text('Último aviso'),
                          SizedBox(width: 10),
                          SizedBox(
                            height: 16,
                            width: 16,
                            child: CircleAvatar(
                              backgroundColor: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NoticiaView(indexSelected: 0),
                            ),
                          );
                        },
                        child: Text(
                          'Ver todos',
                          style: AppFonts.text14RegularUnderline,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.noticicasList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: NewsWidgets(
                                width: 270,
                                cardColor: AppColors.white,
                                tagLabel:
                                    provider.noticicasList[index].tagLabel,
                                tagColor:
                                    provider.noticicasList[index].tagColor,
                                data: provider.noticicasList[index].data,
                                title: provider.noticicasList[index].title,
                                infoText:
                                    provider.noticicasList[index].infoText,
                                onTapCrad: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NoticiaView(indexSelected: index),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: HorarioWidget(
                    horarios: provider.horariosList,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
