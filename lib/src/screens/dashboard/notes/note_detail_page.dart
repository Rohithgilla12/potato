import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/models/index.dart';
import 'package:potato/src/stores/app_store.dart';

class NoteDetailPage extends StatelessWidget {
  const NoteDetailPage({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = locator<AppStore>();

    final Note note = appStore.notes.userNotes.firstWhere(
      (note) => note.id == id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title ?? 'Note Detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          child: Markdown(
            data: note.description ?? 'No Description',
            extensionSet: md.ExtensionSet(
              md.ExtensionSet.gitHubFlavored.blockSyntaxes,
              [
                md.EmojiSyntax(),
                ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
