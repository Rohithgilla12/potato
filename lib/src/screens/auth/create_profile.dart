import 'package:auto_route/auto_route.dart';
import 'package:crispin/crispin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/app_store.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final AppStore appStore = locator<AppStore>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Complete your profile',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
          onChanged: (value) => appStore.auth.name = value,
        ),
        const SizedBox(height: 16.0),
        Observer(
          builder: (_) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ElevatedButton(
              onPressed: () async {
                if (appStore.auth.name != null) {
                  setState(() => isLoading = true);
                  try {
                    await appStore.auth.createInitialProfile();
                    context.router.push(const DashboardRoute());
                  } catch (e, st) {
                    setState(() {
                      isLoading = false;
                    });
                    Crispin().error(
                      e.toString(),
                      error: e,
                      stackTrace: st,
                    );
                  }
                }
              },
              child: const Text('Create Profile'),
            );
          },
        ),
      ],
    );
  }
}
