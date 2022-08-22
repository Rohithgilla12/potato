import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/app_store.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final AppStore appStore = locator<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your note'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          // TODO: Add clean up and pop back after save!
          // TODO: Add loaders
          await appStore.notes.createNote();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Note saved!'),
              ),
            );
          }
          appStore.notes.getUserNotes();
          context.router.navigateBack();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (String value) {
                appStore.notes.title = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 18,
              onChanged: (String value) {
                appStore.notes.description = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
