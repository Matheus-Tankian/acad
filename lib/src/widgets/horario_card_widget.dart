import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/core/app_icons.dart';

class HorarioCardWidget extends StatelessWidget {
  final String horaInicial;
  final String horaFinal;
  final String materia;
  final String nomeProfessor;

  const HorarioCardWidget({
    super.key,
    required this.horaInicial,
    required this.horaFinal,
    required this.materia,
    required this.nomeProfessor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              SizedBox(
                width: 50,
                child: Text(
                  horaInicial,
                  style: AppFonts.text16Semibold,
                ),
              ),
              Text(
                horaFinal,
                style: AppFonts.text12Regular.copyWith(color: AppColors.gray),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Column(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    strokeAlign: 1,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                height: 84,
                width: 1,
                color: Colors.black,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 6,
                left: 22,
              ),
              child: Container(
                height: 80,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.grayCard,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      materia,
                      style: AppFonts.text16Semibold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.teacher,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            nomeProfessor,
                            style: AppFonts.text16Semibold,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
