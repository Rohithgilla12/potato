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

  @observable
  ObservableFuture<List<Note>> userNotesFuture = ObservableFuture.value(<Note>[]);

  @action
  Future<void> getUserNotes() async {
    try {
      final Future<List<Note>> notesFuture = notesApi.getUserNotes(authStore.uid!);
      userNotesFuture = ObservableFuture(notesFuture);
      userNotes = await notesFuture;
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
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  Future<void> deleteNote(String id) async {
    try {
      await notesApi.deleteNote(id);

      // Till we implement the realtime listening, refreshing the list is the easiest way to update the list
      await getUserNotes();
    } catch (e) {
      throw Exception(e);
    }
  }
}
