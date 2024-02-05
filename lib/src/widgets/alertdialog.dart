import 'package:acad/src/app.dart';
import 'package:acad/src/core/app_colors.dart';
import 'package:acad/src/core/app_fonts.dart';
import 'package:flutter/material.dart';

Future<void> alertMessage(
  BuildContext context,
  Function() onPressed,
) async {
  return showDialog<void>(
    context: navigationApp.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.peachFury1,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        title: const Text('Confirmar Saída'),
        content: Text(
          'Você realmente deseja sair?',
          style: AppFonts.text14Regular,
        ),
        actions: <Widget>[
          button(
            name: 'Cancelar',
            color: AppColors.red,
            onTap: () {
              Navigator.of(navigationApp.currentContext!, rootNavigator: true)
                  .pop();
            },
          ),
          button(
            name: 'Sair',
            color: AppColors.blue,
            onTap: onPressed,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 30,
            ),
          ),
        ],
      );
    },
  );
}

Widget button(
    {required String name,
    required Color color,
    Function()? onTap,
    EdgeInsetsGeometry? padding}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(
        name,
        style: AppFonts.text14Semibold.copyWith(color: AppColors.white),
      ),
    ),
  );
}
