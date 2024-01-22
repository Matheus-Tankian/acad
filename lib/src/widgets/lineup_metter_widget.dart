import 'package:flutter/material.dart';

class LineUpMetter extends StatelessWidget {
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final EdgeInsets? padding;
  final int? leadingflex;
  final int? middleFlex;
  final int? trailingflex;

  const LineUpMetter({
    super.key,
    this.leading,
    this.middle,
    this.trailing,
    this.padding,
    this.leadingflex,
    this.middleFlex,
    this.trailingflex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: MediaQuery.of(context).size.width >= 400
                ? (leadingflex ?? 3)
                : (leadingflex ?? 2),
            child: leading ?? const Text(''),
          ),
          Expanded(
            flex: middleFlex ?? 1,
            child: middle ?? const Text(''),
          ),
          Expanded(
            flex: trailingflex ?? 1,
            child: trailing ?? const Text(''),
          ),
        ],
      ),
    );
  }
}
