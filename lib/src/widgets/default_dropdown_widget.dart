import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';

class DefaultDropdownWidget extends StatefulWidget {
  const DefaultDropdownWidget({
    Key? key,
    required this.itens,
    required this.onChanged,
    this.hintText,
    this.hasError = false,
    this.enabled = true,
    this.backgroundColor,
  }) : super(key: key);

  final List<String> itens;
  final Function(String?) onChanged;
  final Widget? hintText;
  final bool hasError;
  final bool enabled;
  final Color? backgroundColor;

  @override
  State<DefaultDropdownWidget> createState() => _DefaultDropdownWidgetState();
}

class _DefaultDropdownWidgetState extends State<DefaultDropdownWidget> {
  String dropdownValue = '';
  bool itemSelected = false;
  OutlineInputBorder getDropdownBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: itemSelected ? AppColors.peachFury5 : AppColors.gray),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Container(
          color: widget.backgroundColor ?? AppColors.grayCard,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: widget.hasError
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    )
                  : getDropdownBorder(),
              border: getDropdownBorder(),
            ),
            hint: widget.hintText ??
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: 'Selecione',
                    style: DefaultTextStyle.of(context).style,
                  ),
                ),
            value: dropdownValue.isNotEmpty ? dropdownValue : null,
            items: [
              ...widget.itens.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width <= 400
                        ? MediaQuery.of(context).size.width * 0.6
                        : MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                );
              }).toList(),
            ],
            onChanged: widget.enabled
                ? (String? value) {
                    setState(() {
                      dropdownValue = value ?? '';
                      dropdownValue != ''
                          ? itemSelected = true
                          : itemSelected = false;
                    });
                    widget.onChanged(value);
                  }
                : null,
          ),
        ),
        widget.hasError ? const SizedBox(height: 6) : const SizedBox(),
        Visibility(
          visible: widget.hasError,
          replacement: const SizedBox(),
          child: Text(
            'Selecione o campo',
            style: AppFonts.text16Regular.copyWith(color: AppColors.red),
          ),
        ),
        widget.hasError ? const SizedBox(height: 6) : const SizedBox(),
      ],
    );
  }
}
