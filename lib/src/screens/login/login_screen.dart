import 'package:flutter/material.dart';
import 'package:sipaealuno/src/views/login/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: LoginView());
  }
}
