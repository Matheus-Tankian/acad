import 'package:flutter/material.dart';
import 'package:sipaealuno/src/screens/home/home_screen.dart';
import 'package:sipaealuno/src/screens/login/login_screen.dart';

class AppRoutes {
  AppRoutes._();

  static String get initial => '/home';
  static Map<String, WidgetBuilder> get all => {
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      };
}
