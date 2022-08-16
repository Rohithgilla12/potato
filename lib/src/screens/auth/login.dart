import 'package:flutter/material.dart';
import 'package:potato/src/layouts/auth_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Form(
        child: Column(),
      ),
    );
  }
}
