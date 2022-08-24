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

  late final _$titleAtom = Atom(name: 'NotesStoreBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'NotesStoreBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$userNotesFutureAtom =
      Atom(name: 'NotesStoreBase.userNotesFuture', context: context);

  @override
  ObservableFuture<List<Note>> get userNotesFuture {
    _$userNotesFutureAtom.reportRead();
    return super.userNotesFuture;
  }

  @override
  set userNotesFuture(ObservableFuture<List<Note>> value) {
    _$userNotesFutureAtom.reportWrite(value, super.userNotesFuture, () {
      super.userNotesFuture = value;
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
  Future<void> createNote() {
    return _$createNoteAsyncAction.run(() => super.createNote());
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('NotesStoreBase.deleteNote', context: context);

  @override
  Future<void> deleteNote(String id) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(id));
  }

  @override
  String toString() {
    return '''
userNotes: ${userNotes},
title: ${title},
description: ${description},
userNotesFuture: ${userNotesFuture}
    ''';
  }
}
