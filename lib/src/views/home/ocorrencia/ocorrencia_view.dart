import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/core/app_fonts.dart';
import 'package:acad/src/repository/ocorrencia/ocorrencia_repository.dart';
import 'package:acad/src/views/home/ocorrencia/ocorrencia_viewmodel.dart';
import 'package:acad/src/widgets/ocorrence_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OcorrenciaView extends StatelessWidget {
  const OcorrenciaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OcorrenciaViewModel>(
      create: (_) => OcorrenciaViewModel(
        OcorrenciaReposityImpl(),
      ),
      child: Consumer<OcorrenciaViewModel>(
        builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Ocorrências',
              style: AppFonts.text22Semibold.copyWith(
                color: AppColors.white,
              ),
            ),
            backgroundColor: AppColors.peachFury5,
          ),
          body: Visibility(
            visible: provider.isLoading,
            replacement: const Center(
              child: CircularProgressIndicator(
                color: AppColors.peachFury5,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: AppColors.gray,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lista de ocorrências',
                        style: AppFonts.text32Semibold,
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.listOccurrences.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: OcorrenceCard(
                              aluno: provider.listOccurrences[index].aluno,
                              id: provider.listOccurrences[index].id,
                              tipo: provider.listOccurrences[index].tipo,
                              data: provider.listOccurrences[index].data,
                              sala: provider.listOccurrences[index].sala,
                              decricao:
                                  provider.listOccurrences[index].descricao,
                            ),
                          );
                        },
                      )
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
