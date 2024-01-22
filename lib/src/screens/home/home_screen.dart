import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/core/app_icons.dart';
import 'package:sipaealuno/src/views/home/aluno/aluno_view.dart';
import 'package:sipaealuno/src/views/home/home_view.dart';
import 'package:sipaealuno/src/views/home/nota/nota_view.dart';
import 'package:sipaealuno/src/views/home/ocorrencia/ocorrencia_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      HomeView(),
      NotaView(),
      OcorrenciaView(),
      AlunoView(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grayBackground,
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.home,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 0
                      ? AppColors.peachFury5
                      : AppColors.grayIcon,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.notas,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 1
                      ? AppColors.peachFury5
                      : AppColors.grayIcon,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Notas',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.edit,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 2
                      ? AppColors.peachFury5
                      : AppColors.grayIcon,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Ocorrências',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.user,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 3
                      ? AppColors.peachFury5
                      : AppColors.grayIcon,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Aluno',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.peachFury5,
          selectedLabelStyle:
              AppFonts.text12Medium.copyWith(color: AppColors.peachFury5),
          unselectedItemColor: AppColors.grayIcon,
          unselectedLabelStyle:
              AppFonts.text12Medium.copyWith(color: AppColors.grayIcon),
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
