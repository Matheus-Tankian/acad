import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';

class BunttonWidget extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? buttonColor;
  final Function() onTap;
  final EdgeInsets? paddingButton;
  final Widget? child;

  const BunttonWidget({
    super.key,
    required this.title,
    this.titleStyle,
    this.buttonColor,
    required this.onTap,
    this.paddingButton,
    this.child,
  });

  @override
  State<BunttonWidget> createState() => _BunttonWidgetState();
}

class _BunttonWidgetState extends State<BunttonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.peachFury5,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding:
              widget.paddingButton ?? const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: widget.child ??
                Text(
                  widget.title,
                  style:
                      AppFonts.text16Semibold.copyWith(color: AppColors.white),
                ),
          ),
        ),
      ),
    );
  }
}
