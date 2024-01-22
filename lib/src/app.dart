import 'package:flutter/material.dart';
import 'package:sipaealuno/src/core/app_colors.dart';
import 'package:sipaealuno/src/core/app_routes.dart';

final navigationApp = GlobalKey<NavigatorState>(debugLabel: "navigationApp");
final navigationScreen =
    GlobalKey<NavigatorState>(debugLabel: "navigationScreen");

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return
        //MultiProvider(
        //providers: const [],
        //child:
        MaterialApp(
      navigatorKey: navigationApp,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      routes: AppRoutes.all,
      theme: ThemeData(
        primaryColor: AppColors.peachFury5,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.peachFury5,
        ),
        useMaterial3: false,
      ),
    );
  }
}
