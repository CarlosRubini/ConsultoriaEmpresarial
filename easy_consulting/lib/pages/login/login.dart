import 'package:flutter/material.dart';
import 'login_web.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return const LoginWeb();
      }),
    );
  }
}
