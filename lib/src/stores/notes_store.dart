import 'package:crispin/crispin.dart';
import 'package:mobx/mobx.dart';
import 'package:potato/src/data/notes_api.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/models/notes/index.dart';
import 'package:potato/src/stores/auth_store.dart';

part 'notes_store.g.dart';

class NotesStore = NotesStoreBase with _$NotesStore;

abstract class NotesStoreBase with Store {
  final AuthStore authStore = locator<AuthStore>();
  final NotesApi notesApi = NotesApi();

  @observable
  List<Note> userNotes = [];

  @observable
  String? title;

  @observable
  String? description;

  @action
  Future<void> getUserNotes() async {
    try {
      await notesApi.getUserNotes(authStore.uid!);
      Crispin().info('getUserNotes response:');
      //userNotes = response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  Future<void> createNote() async {
    try {
      await notesApi.createNote(
        title: title,
        description: description,
      );
      Crispin().info('createNote response:');
    } catch (e) {
      throw Exception(e);
    }
  }
}
