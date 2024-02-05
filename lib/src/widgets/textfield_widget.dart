import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/core/app_fonts.dart';
import 'package:flutter/material.dart';


class TextfieldWidget extends StatefulWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final bool? labelIsvisible;
  final String? labelName;
  final TextStyle? labelNameStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? erroText;
  final TextStyle? erroTextStyle;
  final bool erroTextVisible;
  final bool? isObscure;
  final bool? beBackgroundColor;
  final Color? backgroundColor;

  const TextfieldWidget({
    super.key,
    this.textEditingController,
    this.onChanged,
    this.labelIsvisible,
    this.labelName,
    this.labelNameStyle,
    this.hintText,
    this.hintTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.erroText,
    this.erroTextStyle,
    this.erroTextVisible = false,
    this.isObscure,
    this.beBackgroundColor,
    this.backgroundColor,
  });

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.labelIsvisible ?? false,
          child: Text(
            widget.labelName ?? '',
            style: widget.labelNameStyle ??
                AppFonts.text16Regular.copyWith(color: AppColors.gray),
          ),
        ),
        Visibility(
          visible: widget.labelIsvisible ?? false,
          child: const SizedBox(height: 10),
        ),
        TextField(
          obscureText: widget.isObscure ?? false,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            filled: widget.beBackgroundColor ?? false,
            fillColor: widget.backgroundColor ?? Colors.transparent,
            hintText: widget.hintText ?? 'Digite algo...',
            hintStyle:
                widget.hintTextStyle ?? const TextStyle(color: Colors.grey),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.peachFury5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: widget.erroTextVisible == true
                    ? AppColors.red
                    : AppColors.gray,
              ),
            ),
          ),
          onChanged: widget.onChanged,
        ),
        Visibility(
          visible: widget.erroTextVisible,
          child: const SizedBox(height: 8),
        ),
        Visibility(
          visible: widget.erroTextVisible,
          child: Text(
            widget.erroText ?? 'Error',
            style: widget.erroTextStyle ??
                AppFonts.text16Regular.copyWith(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
