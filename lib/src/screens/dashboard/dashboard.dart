import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/app_store.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = locator<AppStore>();

    return Observer(builder: (context) {
      return Scaffold(
        floatingActionButton: appStore.tabIndex == 0
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  //await appStore.notes.createNote(
                  //title: 'New Note',
                  //description: 'This is a new note',
                  //);
                },
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appStore.tabIndex,
          onTap: (int index) {
            appStore.tabIndex = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: <Widget>[
          const Text('Home'),
          const Text('Profile'),
        ][appStore.tabIndex],
      );
    });
  }
}
