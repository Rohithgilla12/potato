import 'package:mobx/mobx.dart';

part 'clipboard_store.g.dart';

class ClipboardStore = ClipboardStoreBase with _$ClipboardStore;

abstract class ClipboardStoreBase with Store {
  @observable
  List<String> clipboard = [];
}
