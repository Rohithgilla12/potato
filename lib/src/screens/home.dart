import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/screens/auth/create_profile.dart';
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await appStore.auth.getUser(appStore.auth.uid!);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            if (appStore.auth.uid == null) {
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
            } else if (appStore.auth.uid != null && appStore.auth.userProfile == null) {
              return const CreateProfile();
            }
            return const Center(
              child: Text('Redirect me / Add a button to take me somewhere else'),
            );
          },
        ),
      ),
    );
  }
}
