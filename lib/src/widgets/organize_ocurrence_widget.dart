import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';

class OrganizeOccurrence extends StatelessWidget {
  final String leadingTitle;
  final TextStyle? leadingTitleStyle;
  final String trailingTitle;
  final TextStyle? trailingTitleStyle;
  final double? space;
  final int? trailingFlex;
  final int? leadingFlex;

  const OrganizeOccurrence({
    super.key,
    required this.leadingTitle,
    required this.trailingTitle,
    this.leadingTitleStyle,
    this.trailingTitleStyle,
    this.space,
    this.trailingFlex,
    this.leadingFlex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: MediaQuery.of(context).size.width <= 400
                  ? (leadingFlex ?? 3)
                  : (leadingFlex ?? 4),
              child: Text(
                leadingTitle,
                style: leadingTitleStyle ??
                    AppFonts.text16Black.copyWith(color: AppColors.peachFury2),
              ),
            ),
            Expanded(
              flex: trailingFlex ?? 2,
              child: Text(
                trailingTitle,
                style: trailingTitleStyle ??
                    AppFonts.text16Black.copyWith(color: AppColors.peachFury2),
              ),
            ),
          ],
        ),
        SizedBox(height: space ?? 2),
      ],
    );
  }
}

class OccurrenceItens {
  final String aluno;
  final int id;
  final String tipo;
  final String data;
  final String escola;
  final String descricao;

  OccurrenceItens({
    required this.aluno,
    required this.id,
    required this.tipo,
    required this.data,
    required this.escola,
    required this.descricao,
  });
}
