import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/core/app_fonts.dart';
import 'package:acad/src/widgets/tag_widget.dart';
import 'package:flutter/material.dart';

class NewsWidgets extends StatelessWidget {
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Decoration? decorate;
  final List<Widget>? cardItens;
  final String tagLabel;
  final TextStyle? tagStyle;
  final Color tagColor;
  final String data;
  final String title;
  final String infoText;
  final Color cardColor;

  final Function() onTapCrad;

  const NewsWidgets({
    super.key,
    this.padding,
    this.height,
    this.width,
    this.decorate,
    this.cardItens,
    required this.tagLabel,
    this.tagStyle,
    required this.tagColor,
    required this.data,
    required this.title,
    required this.infoText,
    this.cardColor = AppColors.white,
    required this.onTapCrad,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCrad,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
        height: height ?? 160,
        width: width ?? double.infinity,
        decoration: decorate ??
            BoxDecoration(
              color: cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: AppColors.peachFury7,
                width: 1.0,
              ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: cardItens ??
              [
                Text(
                  data,
                  style: AppFonts.text14Regular,
                ),
                const SizedBox(height: 4),
                TagWidget(
                  backgroundColor: tagColor,
                  label: tagLabel,
                  labelStyle: tagStyle ??
                      AppFonts.text10Semibold.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: AppFonts.text16Semibold,
                ),
                const SizedBox(height: 8),
                Text(
                  infoText,
                  style: AppFonts.text12Regular,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
              ],
        ),
      ),
    );
  }
}
