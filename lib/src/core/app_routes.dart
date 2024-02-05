import 'package:flutter/material.dart';
import 'package:sipaealuno/src/app.dart';
import 'package:sipaealuno/src/screens/home/home_screen.dart';
import 'package:sipaealuno/src/screens/login/login_screen.dart';

class AppRoutes {
  AppRoutes._();

  static String get initial => '/';
  static Map<String, WidgetBuilder> get all => {
        '/': (_) => const IsAuth(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      };
}
