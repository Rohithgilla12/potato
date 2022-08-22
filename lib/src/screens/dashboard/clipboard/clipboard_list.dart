import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/models/index.dart';
import 'package:potato/src/stores/clipboard_store.dart';

class ClipboardListPage extends StatelessWidget {
  const ClipboardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ClipboardStore clipboardStore = locator<ClipboardStore>();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height,
        child: Observer(
          builder: (_) {
            return ListView.separated(
              reverse: true,
              itemBuilder: (context, int index) {
                final PClipboard clipboard = clipboardStore.clipboard[index];
                return ListTile(
                  title: Text(
                    clipboard.text,
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      Clipboard.setData(ClipboardData(text: clipboard.text));
                    },
                    icon: const Icon(
                      FlutterRemix.file_copy_2_line,
                    ),
                  ),
                );
              },
              separatorBuilder: ((context, index) => const Divider()),
              itemCount: clipboardStore.clipboard.length,
            );
          },
        ),
      ),
    );
  }
}
