import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/repository/escola/escola_repository.dart';
import 'package:sipaealuno/src/repository/materia/materia_repository.dart';
import 'package:sipaealuno/src/repository/turma/turma_repository.dart';
import 'package:sipaealuno/src/views/home/nota/nota_viewmodel.dart';
import 'package:sipaealuno/src/widgets/default_dropdown_widget.dart';
import 'package:sipaealuno/src/widgets/matter_widget.dart';

class NotaView extends StatelessWidget {
  const NotaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotaViewModel>(
      create: (_) => NotaViewModel(
        TurmaReposityImpl(),
        EscolaReposityImpl(),
        MateriaReposityImpl(),
      ),
      child: Consumer<NotaViewModel>(
        builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.peachFury5,
            title: Text(
              'Notas',
              style: AppFonts.text22Semibold.copyWith(
                color: AppColors.white,
              ),
            ),
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
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        strokeAlign: 1,
                        color: AppColors.grayCard,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selecione uma escola',
                        style: AppFonts.text32Semibold,
                      ),
                      const SizedBox(height: 28),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Escola',
                            style: AppFonts.text18Semibold
                                .copyWith(color: AppColors.grayText),
                          ),
                          const SizedBox(height: 10),
                          DefaultDropdownWidget(
                            itens: provider.escolas,
                            onChanged: (value) {
                              provider.changeEscola(value!);
                            },
                            hintText: const Text(
                              'Selecione uma escola',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            hasError: false,
                          ),
                        ],
                      ),
                      //======
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Turma',
                            style: AppFonts.text18Semibold
                                .copyWith(color: AppColors.grayText),
                          ),
                          const SizedBox(height: 10),
                          DefaultDropdownWidget(
                            itens: provider.turmas,
                            onChanged: (value) {
                              provider.changeTurma(value!);
                            },
                            hintText: const Text(
                              'Seleceione uma turma',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            hasError: false,
                          ),
                        ],
                      ),
                      //=====
                      Visibility(
                        visible: provider.hasSchool == true,
                        replacement: const SizedBox(),
                        child: Visibility(
                          visible: provider.loadMatter == false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                'Nome: ${provider.nomeAluno}',
                                style: AppFonts.text18Semibold,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Ano: ${provider.ano}',
                                style: AppFonts.text18Semibold,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Turma: ${provider.turmaEncontrada}',
                                style: AppFonts.text18Semibold,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      //========
                      Visibility(
                        visible: provider.hasSchool == true,
                        replacement: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              'Selecione um escola e uma turma!',
                              style: AppFonts.text18Semibold,
                            ),
                          ),
                        ),
                        child: Visibility(
                          visible: provider.loadMatter == false,
                          replacement: const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.peachFury5,
                              ),
                            ),
                          ),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: provider.notas.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Matter(
                                    materia: provider.notas[index].materia,
                                    primeiroBi:
                                        provider.notas[index].primeiroBi,
                                    segundoBi: provider.notas[index].segundoBi,
                                    terceiroBi:
                                        provider.notas[index].terceiroBi,
                                    quartoBi: provider.notas[index].quartoBi,
                                    primeiroFalt:
                                        provider.notas[index].primeiroFalt,
                                    segundoFalt:
                                        provider.notas[index].segundoFalt,
                                    terceiroFalt:
                                        provider.notas[index].terceiroFalt,
                                    quartoFalt:
                                        provider.notas[index].quartoFalt,
                                    totalFalt: provider.notas[index].totalFalt,
                                    mediaFinal:
                                        provider.notas[index].mediaFinal,
                                    media: provider.notas[index].media,
                                    recuperacao:
                                        provider.notas[index].recuperacao ?? '',
                                    conselho:
                                        provider.notas[index].conselho ?? '',
                                  ),
                                );
                              }),
                        ),
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
