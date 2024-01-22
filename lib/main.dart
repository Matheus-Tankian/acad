import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sipaealuno/src/app.dart';
import 'package:sipaealuno/src/core/app_colors.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
        useMaterial3: false,
      ),
      home: const App(),
    );
  }
}
