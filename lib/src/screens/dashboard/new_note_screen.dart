import 'package:flutter/material.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/app_store.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = locator<AppStore>();
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
//          final ClipboardData? clipboard =
          //await Clipboard.getData('text/plain');
          //Crispin().info('Clipboard data: ${clipboard?.text}');
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (String value) {
                appStore.notes.title = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
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
