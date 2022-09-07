import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/screens/auth/create_profile.dart';
import 'package:potato/src/stores/app_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppStore appStore = locator<AppStore>();

  @override
  initState() {
    super.initState();

    if (appStore.auth.userProfile != null) {
      context.router.push(const DashboardRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          context.router.replaceAll([const DashboardRoute()]);
          // await appStore.auth.getUser(appStore.auth.uid!);
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
                    child: Text('If you are redirected from login page, please click on the email link to complete the sign up process.'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(const LoginRoute());
                    },
                    child: const Text('Login'),
                  ),
                ],
              );
            } else if (appStore.auth.uid != null //
                &&
                appStore.auth.userProfile == null) {
              return const CreateProfile();
            } else {
              // Temp
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Maynot be the best for now, lets' listen to the store and push later
                context.router.replaceAll([const DashboardRoute()]);
              });
              return const Text('Loading;');
            }

            //  return const Center(
            //child: Text('Redirect me / Add a button to take me somewhere else'),
            //);
          },
        ),
      ),
    );
  }
}
