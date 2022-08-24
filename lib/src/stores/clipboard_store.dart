import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:potato/src/models/clipboard/index.dart';
import 'package:uuid/uuid.dart';

part 'clipboard_store.g.dart';

class ClipboardStore = ClipboardStoreBase with _$ClipboardStore;

abstract class ClipboardStoreBase with Store {
  final uuid = const Uuid();

  @observable
  List<PClipboard> clipboard = [];

  @action
  Future<void> getClipboard() async {
    final ClipboardData? clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      if (clipboardData.text != null) {
        //create clipboard object
        final PClipboard clipboardObject = PClipboard(
          id: uuid.v4(),
          text: clipboardData.text!,
        );

        // Need to check recent value and if it is the same as the current value, then don't add it to the list
        if (clipboard.isNotEmpty && clipboard.last.text == clipboardObject.text) {
          return;
        }
        // Ah very weird but doing this would reload :(
        clipboard = [...clipboard, clipboardObject];
      }
    }
  }

  @action
  Future<void> listenToClipboard() async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await getClipboard();
    });
  }
}
