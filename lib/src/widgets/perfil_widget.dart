import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';

class PerfilWidget extends StatelessWidget {
  final String nome;
  final String? infoText;
  final String? foto;
  final Color? color;
  final TextStyle? nameTextStyle;
  final TextStyle? infoTextStyle;
  final Widget? card;
  final double? avatarSize;
  const PerfilWidget({
    super.key,
    required this.nome,
    this.foto,
    this.color,
    this.nameTextStyle,
    this.infoTextStyle,
    this.card,
    this.infoText,
    this.avatarSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: avatarSize ?? 60,
              width: avatarSize ?? 60,
              decoration: BoxDecoration(
                color: color ?? AppColors.gray,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: card ??
                  const Icon(
                    Icons.person,
                    size: 50,
                  ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              infoText ?? 'Óla, Bem-vindo',
              style: infoTextStyle ??
                  AppFonts.text18Semibold.copyWith(color: AppColors.white),
            ),
            Text(
              nome,
              overflow: TextOverflow.ellipsis,
              style: nameTextStyle ??
                  AppFonts.text32Semibold.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ],
    );
  }
}
