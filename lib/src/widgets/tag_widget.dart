import 'package:acad/src/core/app_fonts.dart';
import 'package:flutter/material.dart';


class TagWidget extends StatelessWidget {
  final Color backgroundColor;
  final String label;
  final double? borderRadius;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;

  const TagWidget({
    super.key,
    required this.backgroundColor,
    required this.label,
    this.borderRadius,
    this.padding,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 4)),
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 9,
            ),
        child: Text(
          label,
          style: labelStyle ??
              AppFonts.text10Semibold.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
