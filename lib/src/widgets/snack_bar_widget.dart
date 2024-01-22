import 'package:flutter/material.dart';

void showSnackBarMessage(
  BuildContext context, {
  Color? backgroundColor,
  required String message,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration ?? const Duration(milliseconds: 4000),
      backgroundColor: backgroundColor,
      content: Text(message),
    ),
  );
}
