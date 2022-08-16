import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/stores/app_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = AppStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Observer(
        builder: (_) {
          if (appStore.auth.user == null) {
            return Column(
              children: [
                const Center(
                  child: Text('Landing Copies'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(const LoginRoute());
                      },
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(const SignUpRoute());
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            );
          }
          return const Center(
            child: Text('Redirect me / Add a button to take me somewhere else'),
          );
        },
      ),
    );
  }
}
