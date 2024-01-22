import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';

class DefaultDropdownWidget extends StatefulWidget {
  const DefaultDropdownWidget({
    Key? key,
    required this.itens,
    required this.onChanged,
    this.hintText,
    this.hasError = false,
    this.enabled = true,
  }) : super(key: key);

  final List<String> itens;
  final Function(String?) onChanged;
  final Widget? hintText;
  final bool hasError;
  final bool enabled;

  @override
  State<DefaultDropdownWidget> createState() => _DefaultDropdownWidgetState();
}

class _DefaultDropdownWidgetState extends State<DefaultDropdownWidget> {
  String dropdownValue = '';
  OutlineInputBorder dropdownBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gray),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.hasError,
          replacement: const SizedBox(),
          child: Text(
            '*Campo obrigatório',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.red),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          color: AppColors.grayCard,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: widget.hasError
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    )
                  : dropdownBorder,
              border: dropdownBorder, // Adicione esta linha
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
                    });
                    widget.onChanged(value);
                  }
                : null,
          ),
        ),
        Visibility(
          visible: widget.hasError,
          replacement: const SizedBox(),
          child: const Text('Selecione o campo'),
        ),
        widget.hasError ? const SizedBox(height: 6) : const SizedBox(),
      ],
    );
  }
}
