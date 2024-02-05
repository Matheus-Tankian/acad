import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_fonts.dart';

class AppTheme {
  ThemeData get themeData => ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.red),
          selectedItemColor: Colors.amber[800],
          selectedLabelStyle: TextStyle(color: Colors.amber[800]),
        ),
        primaryColor: AppColors.peachFury5,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.peachFury5,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.peachFury5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.peachFury5),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.peachFury5,
          titleTextStyle: AppFonts.text22Semibold.copyWith(
            color: AppColors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      );
}
