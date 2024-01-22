import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/widgets/ocorrence_card_widget.dart';
import 'package:sipaealuno/src/widgets/organize_ocurrence_widget.dart';

class Occurrence extends StatelessWidget {
  const Occurrence({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OccurrenceItens> lista = [
      OccurrenceItens(
          aluno: 'jose',
          id: 0,
          tipo: 'fei',
          data: '12/12/2024',
          escola: 'matadouro',
          descricao: 'nasceu assim'),
      OccurrenceItens(
          aluno: 'yann',
          id: 24,
          tipo: 'fei',
          data: '12/12/2024',
          escola: 'burutu bravo',
          descricao: 'e do mato'),
      OccurrenceItens(
          aluno: 'leo',
          id: 23,
          tipo: 'doente mental',
          data: '12/12/2024',
          escola: 'ponte',
          descricao: 'tem demencia'),
      OccurrenceItens(
          aluno: 'leo',
          id: 23,
          tipo: 'doente mental',
          data: '12/12/2024',
          escola: 'ponte',
          descricao: 'tem demencia'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ocorrências'),
        backgroundColor: AppColors.peachFury5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.gray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Lista de ocorrências',
                style: AppFonts.text32Semibold,
              ),
              const SizedBox(height: 16),
              Expanded(
                  child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: OcorrenceCard(
                      aluno: lista[index].aluno,
                      id: lista[index].id,
                      tipo: lista[index].tipo,
                      data: lista[index].data,
                      sala: lista[index].escola,
                      decricao: lista[index].descricao,
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
