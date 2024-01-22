import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';
import 'package:sipaealuno/src/widgets/lineup_metter_widget.dart';
import 'package:sipaealuno/src/widgets/tag_widget.dart';

class Matter extends StatefulWidget {
  final String materia;
  final int primeiroFalt;
  final int segundoFalt;
  final int terceiroFalt;
  final int quartoFalt;
  final int totalFalt;
  final String primeiroBi;
  final String segundoBi;
  final String terceiroBi;
  final String quartoBi;
  final String mediaFinal;
  final String media;
  final String recuperacao;
  final String conselho;

  const Matter({
    super.key,
    required this.materia,
    required this.primeiroBi,
    required this.segundoBi,
    required this.terceiroBi,
    required this.quartoBi,
    required this.primeiroFalt,
    required this.segundoFalt,
    required this.terceiroFalt,
    required this.quartoFalt,
    required this.totalFalt,
    required this.mediaFinal,
    required this.media,
    required this.recuperacao,
    required this.conselho,
  });

  @override
  State<Matter> createState() => _MatterState();
}

class _MatterState extends State<Matter> {
  bool isOppen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //materia
        Visibility(
          visible: isOppen,
          replacement: InkWell(
            onTap: () {
              setState(() {
                isOppen = !isOppen;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.peachFury6,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.materia,
                      style: AppFonts.text18Semibold
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppColors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                isOppen = !isOppen;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 36,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.peachFury6,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.materia,
                      style: AppFonts.text18Semibold
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_drop_up_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
        //notas
        Visibility(
          visible: isOppen,
          child: Container(
            color: AppColors.grayMateria,
            child: Column(
              children: [
                const SizedBox(height: 22),
                LineUpMetter(
                  middle: Center(
                    child: Text(
                      'notas',
                      style: AppFonts.text18Regular,
                    ),
                  ),
                  trailing: Center(
                    child: Text(
                      'faltas',
                      style: AppFonts.text18Regular,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                LineUpMetter(
                  leading: Text(
                    '1º Bimestre',
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.text18Semibold,
                  ),
                  middle: Center(
                    child: SizedBox(
                      child: TagWidget(
                        backgroundColor: AppColors.peachFury5,
                        label: widget.primeiroBi,
                        labelStyle: AppFonts.text16Semibold
                            .copyWith(color: AppColors.white),
                        borderRadius: 8,
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  trailing: Center(
                    child: Text(
                      '${widget.primeiroFalt}',
                      style: AppFonts.text18Regular,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                LineUpMetter(
                  leading: Text(
                    '2º Bimestre',
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.text18Semibold,
                  ),
                  middle: Center(
                    child: SizedBox(
                      child: TagWidget(
                        backgroundColor: AppColors.peachFury5,
                        label: widget.segundoBi,
                        labelStyle: AppFonts.text16Semibold
                            .copyWith(color: AppColors.white),
                        borderRadius: 8,
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  trailing: Center(
                    child: Text(
                      '${widget.segundoFalt}',
                      style: AppFonts.text18Regular,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                LineUpMetter(
                  leading: Text(
                    '3º Bimestre',
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.text18Semibold,
                  ),
                  middle: Center(
                    child: SizedBox(
                      child: TagWidget(
                        backgroundColor: AppColors.peachFury5,
                        label: widget.terceiroBi,
                        labelStyle: AppFonts.text16Semibold
                            .copyWith(color: AppColors.white),
                        borderRadius: 8,
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                      ),
                    ),
                  ),
                  trailing: Center(
                    child: Text(
                      '${widget.terceiroFalt}',
                      style: AppFonts.text18Regular,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                LineUpMetter(
                  leading: Text(
                    '4º Bimestre',
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.text18Semibold,
                  ),
                  middle: Center(
                    child: SizedBox(
                      child: TagWidget(
                        backgroundColor: AppColors.peachFury5,
                        label: widget.quartoBi,
                        labelStyle: AppFonts.text16Semibold
                            .copyWith(color: AppColors.white),
                        borderRadius: 8,
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  trailing: Center(
                    child: Text(
                      '${widget.quartoFalt}',
                      style: AppFonts.text18Regular,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                LineUpMetter(
                  leading: Text(
                    'Média',
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.text18Semibold,
                  ),
                  middle: Center(
                    child: SizedBox(
                      child: TagWidget(
                        backgroundColor: AppColors.peachFury5,
                        label: widget.media,
                        labelStyle: AppFonts.text16Semibold
                            .copyWith(color: AppColors.white),
                        borderRadius: 8,
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                      ),
                    ),
                  ),
                  trailing: Center(
                    child: Text(
                      '',
                      style: AppFonts.text18Regular,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Visibility(
                  visible:
                      (widget.conselho != '') || (widget.recuperacao != ''),
                  child: const Divider(
                    color: AppColors.black,
                    height: 2,
                  ),
                ),
                Visibility(
                  visible: widget.recuperacao != '',
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      LineUpMetter(
                        leading: Text(
                          'Recuperação',
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.text18Semibold,
                        ),
                        middle: Center(
                          child: SizedBox(
                            child: TagWidget(
                              backgroundColor: AppColors.peachFury5,
                              label: widget.recuperacao,
                              labelStyle: AppFonts.text16Semibold
                                  .copyWith(color: AppColors.white),
                              borderRadius: 8,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                            ),
                          ),
                        ),
                        trailing: Center(
                          child: Text(
                            '',
                            style: AppFonts.text18Regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.conselho != '',
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      LineUpMetter(
                        leading: Text(
                          'Conselho',
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.text18Semibold,
                        ),
                        middle: Center(
                          child: SizedBox(
                            child: TagWidget(
                              backgroundColor: AppColors.peachFury5,
                              label: widget.conselho,
                              labelStyle: AppFonts.text16Semibold
                                  .copyWith(color: AppColors.white),
                              borderRadius: 8,
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                        trailing: Center(
                          child: Text(
                            '',
                            style: AppFonts.text18Regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        //resultado
        Visibility(
          visible: isOppen,
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            height: 72,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.peachFury6,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Total de faltas',
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.text18Semibold
                                .copyWith(color: AppColors.white),
                          ),
                          Text(
                            '${widget.totalFalt}',
                            style: AppFonts.text18Semibold
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Média final',
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.text18Semibold
                                .copyWith(color: AppColors.white),
                          ),
                          Text(
                            widget.mediaFinal,
                            style: AppFonts.text18Semibold
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
