import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/app_store.dart';

class DashboardNotes extends StatelessWidget {
  const DashboardNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = locator<AppStore>();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Observer(
        builder: (context) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: appStore.notes.userNotes.length,
            itemBuilder: (context, index) {
              final note = appStore.notes.userNotes[index];
              return ListTile(
                title: Text(note.title ?? 'No Title'),
                subtitle: Text(
                  note.description ?? 'No Description',
                  maxLines: 3,
                ),
                onTap: () {
                  context.router.push(NoteDetailRoute(id: note.id));
                },
              );
            },
          );
        },
      ),
    );
  }
}
