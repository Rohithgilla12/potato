import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/screens/dashboard/dashboard_notes.dart';
import 'package:potato/src/stores/app_store.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final AppStore appStore = locator<AppStore>();

  @override
  initState() {
    super.initState();
    appStore.notes.getUserNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        floatingActionButton: appStore.tabIndex == 0
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  context.router.push(const NewNoteRoute());
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
              icon: Icon(FlutterRemix.booklet_line),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterRemix.clipboard_line),
              label: 'Clipboard',
            ),
          ],
        ),
        body: <Widget>[
          const DashboardNotes(),
          // TODO: Timer based checking of clipboard
          const Text('Profile'),
        ][appStore.tabIndex],
      );
    });
  }
}
