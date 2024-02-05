import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sipaealuno/src/core/app_routes.dart';
import 'package:sipaealuno/src/core/app_thema.dart';
import 'package:sipaealuno/src/models/auth/auth_response_model.dart';
import 'package:sipaealuno/src/screens/home/home_screen.dart';
import 'package:sipaealuno/src/screens/login/login_screen.dart';
import 'package:sipaealuno/src/utils/cache_repository.dart';
import 'package:sipaealuno/src/utils/hive_box.dart';

final navigationApp = GlobalKey<NavigatorState>(debugLabel: "navigationApp");
final navigationScreen =
    GlobalKey<NavigatorState>(debugLabel: "navigationScreen");

final AppTheme appTheme = AppTheme();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationApp,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      routes: AppRoutes.all,
      theme: appTheme.themeData,
    );
  }
}

class IsAuth extends StatelessWidget {
  const IsAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCache = HiveCache(
      Hive.box(hiveAuthBoxName),
    ).getFromCache(key: hiveAuthBoxKey);

    final authData = AuthResponseModel.fromJson(authCache);

    log("Auth data: ${authData.toJson()}");
    return (authData.token.isNotEmpty && authData.userId.isNotEmpty)
        ? const HomeScreen()
        : const LoginScreen();
  }
}
