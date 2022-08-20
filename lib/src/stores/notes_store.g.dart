// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on NotesStoreBase, Store {
  late final _$userNotesAtom =
      Atom(name: 'NotesStoreBase.userNotes', context: context);

  @override
  List<Note> get userNotes {
    _$userNotesAtom.reportRead();
    return super.userNotes;
  }

  @override
  set userNotes(List<Note> value) {
    _$userNotesAtom.reportWrite(value, super.userNotes, () {
      super.userNotes = value;
    });
  }

  late final _$getUserNotesAsyncAction =
      AsyncAction('NotesStoreBase.getUserNotes', context: context);

  @override
  Future<void> getUserNotes() {
    return _$getUserNotesAsyncAction.run(() => super.getUserNotes());
  }

  late final _$createNoteAsyncAction =
      AsyncAction('NotesStoreBase.createNote', context: context);

  @override
  Future<void> createNote({String? title, String? description}) {
    return _$createNoteAsyncAction
        .run(() => super.createNote(title: title, description: description));
  }

  @override
  String toString() {
    return '''
userNotes: ${userNotes}
    ''';
  }
}
