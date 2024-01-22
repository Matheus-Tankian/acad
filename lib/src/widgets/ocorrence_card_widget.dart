import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/widgets/lineup_metter_widget.dart';
import 'package:sipaealuno/src/widgets/organize_ocurrence_widget.dart';

class OcorrenceCard extends StatelessWidget {
  final String aluno;
  final int id;
  final String tipo;
  final String data;
  final String sala;
  final String decricao;

  const OcorrenceCard({
    super.key,
    required this.aluno,
    required this.id,
    required this.tipo,
    required this.data,
    required this.sala,
    required this.decricao,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _ocorrenciaDialogo(
          context,
          aluno: aluno,
          id: id,
          tipo: tipo,
          data: data,
          escola: sala,
          descricao: decricao,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 10,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.peachFury6,
          border: Border.all(
            color: AppColors.peachFury7,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const OrganizeOccurrence(
              leadingTitle: 'Aluno',
              trailingTitle: 'ID',
            ),
            OrganizeOccurrence(
              leadingTitle: aluno,
              trailingTitle: '$id',
              leadingTitleStyle:
                  AppFonts.text16Semibold.copyWith(color: AppColors.white),
              trailingTitleStyle:
                  AppFonts.text16Semibold.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 2),
            const OrganizeOccurrence(
              leadingTitle: 'Tipo',
              trailingTitle: 'Data',
            ),
            OrganizeOccurrence(
              leadingTitle: tipo,
              trailingTitle: data,
              leadingTitleStyle:
                  AppFonts.text16Semibold.copyWith(color: AppColors.white),
              trailingTitleStyle:
                  AppFonts.text16Semibold.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 2),
            const OrganizeOccurrence(
              leadingTitle: 'Sala',
              trailingTitle: '',
            ),
            OrganizeOccurrence(
              leadingTitle: sala,
              trailingFlex: 0,
              trailingTitle: '',
              leadingTitleStyle:
                  AppFonts.text16Semibold.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

void _ocorrenciaDialogo(
  BuildContext context, {
  required final String aluno,
  required final int id,
  required final String tipo,
  required final String data,
  required final String escola,
  required final String descricao,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.peachFury3,
        content: SizedBox(
          width: MediaQuery.of(context).size.height * 1,
          height: MediaQuery.of(context).size.height * 0.6,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ocorrência',
                  style: AppFonts.text32Semibold,
                ),
                const SizedBox(height: 32),
                LineUpMetter(
                  leading: Text(
                    'ID',
                    style: AppFonts.text18Black,
                  ),
                  trailing: Text(
                    'Data',
                    style: AppFonts.text18Black,
                  ),
                  padding: EdgeInsets.zero,
                  leadingflex: 2,
                  middleFlex: MediaQuery.of(context).size.width >= 400 ? 1 : 0,
                  trailingflex: 2,
                ),
                LineUpMetter(
                  leading: Text(
                    '$id',
                    style: AppFonts.text18Semibold,
                  ),
                  trailing: Text(
                    data,
                    style: AppFonts.text18Semibold,
                  ),
                  padding: EdgeInsets.zero,
                  leadingflex: 2,
                  middleFlex: MediaQuery.of(context).size.width >= 400 ? 1 : 0,
                  trailingflex: 2,
                ),
                const SizedBox(height: 22),
                Text(
                  'Aluno',
                  style: AppFonts.text18Black,
                ),
                Text(
                  aluno,
                  style: AppFonts.text18Semibold,
                ),
                const SizedBox(height: 22),
                Text(
                  'Sala',
                  style: AppFonts.text18Black,
                ),
                Text(
                  escola,
                  style: AppFonts.text18Semibold,
                ),
                const SizedBox(height: 22),
                Text(
                  'Tipo',
                  style: AppFonts.text18Black,
                ),
                Text(
                  tipo,
                  style: AppFonts.text18Semibold,
                ),
                const SizedBox(height: 22),
                Text(
                  'Descrição',
                  style: AppFonts.text18Black,
                ),
                Text(
                  descricao,
                  style: AppFonts.text18Semibold,
                ),
              ],
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
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
                  'Fechar',
                  style:
                      AppFonts.text16Semibold.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
