import 'package:acad/src/app.dart';
import 'package:acad/src/screens/home/home_screen.dart';
import 'package:acad/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static String get initial => '/';
  static Map<String, WidgetBuilder> get all => {
        '/': (_) => const IsAuth(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      };
}
