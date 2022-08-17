import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/app_store.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = locator<AppStore>();

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
            return ElevatedButton(
              onPressed: () async {
                if (appStore.auth.name != null) {
                  await appStore.auth.createInitialProfile();
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
