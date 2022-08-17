import 'package:flutter/material.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/layouts/auth_layout.dart';
import 'package:potato/src/stores/app_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final AppStore appStore = locator<AppStore>();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            ElevatedButton(
              child: const Text('Send magic link'),
              onPressed: () async {
                await appStore.auth.loginWithMagicLink(_emailController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
