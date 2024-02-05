import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/core/app_fonts.dart';
import 'package:acad/src/models/horario/horario_model.dart';
import 'package:acad/src/widgets/horario_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorarioWidget extends StatefulWidget {
  final List<DiaModel> horarios;
  const HorarioWidget({
    super.key,
    required this.horarios,
  });

  @override
  State<HorarioWidget> createState() => _HorarioWidgetState();
}

class _HorarioWidgetState extends State<HorarioWidget> {
  String diaDaSemana = '';
  String diaSelecionado = 'seg';
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    diaDaSemana = DateFormat('EEEE', 'pt_BR').format(now);
    diaSelecionado = diaDaSemana.substring(0, 3);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.peachFury6,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(
                'Horário',
                style: AppFonts.text16Semibold.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(
                color: AppColors.gray,
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    diaSelecionado = 'dom';
                  });
                },
                child: Text(
                  'Dom',
                  style: AppFonts.text16Semibold.copyWith(
                      color: diaSelecionado == 'dom'
                          ? AppColors.peachFury6
                          : AppColors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    diaSelecionado = 'seg';
                  });
                },
                child: Text(
                  'Seg',
                  style: AppFonts.text16Semibold.copyWith(
                      color: diaSelecionado == 'seg'
                          ? AppColors.peachFury6
                          : AppColors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    diaSelecionado = 'ter';
                  });
                },
                child: Text(
                  'Ter',
                  style: AppFonts.text16Semibold.copyWith(
                      color: diaSelecionado == 'ter'
                          ? AppColors.peachFury6
                          : AppColors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    diaSelecionado = 'qua';
                  });
                },
                child: Text(
                  'Qua',
                  style: AppFonts.text16Semibold.copyWith(
                      color: diaSelecionado == 'qua'
                          ? AppColors.peachFury6
                          : AppColors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    diaSelecionado = 'qui';
                  });
                },
                child: Text(
                  'Qui',
                  style: AppFonts.text16Semibold.copyWith(
                      color: diaSelecionado == 'qui'
                          ? AppColors.peachFury6
                          : AppColors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    diaSelecionado = 'sex';
                  });
                },
                child: Text(
                  'Sex',
                  style: AppFonts.text16Semibold.copyWith(
                      color: diaSelecionado == 'sex'
                          ? AppColors.peachFury6
                          : AppColors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    diaSelecionado = 'sáb';
                  });
                },
                child: Text(
                  'Sáb',
                  style: AppFonts.text16Semibold.copyWith(
                      color: diaSelecionado == 'sáb'
                          ? AppColors.peachFury6
                          : AppColors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: AppColors.gray,
                  width: 1,
                ),
                right: BorderSide(
                  color: AppColors.gray,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: AppColors.gray,
                  width: 1,
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: widget.horarios.length,
            itemBuilder: (BuildContext context, indexDia) {
              DiaModel dia = widget.horarios[indexDia];
              if (dia.dia.substring(0, 3).toLowerCase() == diaSelecionado) {
                if (dia.horarios.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dia.horarios.length,
                    itemBuilder: (BuildContext context, indexHorario) {
                      HorarioModel horario = dia.horarios[indexHorario];
                      return HorarioCardWidget(
                        horaInicial: horario.horaInicial,
                        horaFinal: horario.horaFinal,
                        materia: horario.materia,
                        nomeProfessor: horario.nomeProfessor,
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      "Não há horários disponíveis para este dia.",
                      style: AppFonts.text16Semibold,
                    ),
                  );
                }
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
