import 'package:flutter/material.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/layouts/auth_layout.dart';
import 'package:potato/src/stores/app_store.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final AppStore appStore = locator<AppStore>();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            ElevatedButton(
              child: const Text('Sign Up'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await appStore.auth.signUp(
                    _emailController.text,
                    _passwordController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
