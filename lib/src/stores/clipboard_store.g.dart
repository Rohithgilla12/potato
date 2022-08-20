// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClipboardStore on ClipboardStoreBase, Store {
  late final _$clipboardAtom =
      Atom(name: 'ClipboardStoreBase.clipboard', context: context);

  @override
  List<String> get clipboard {
    _$clipboardAtom.reportRead();
    return super.clipboard;
  }

  @override
  set clipboard(List<String> value) {
    _$clipboardAtom.reportWrite(value, super.clipboard, () {
      super.clipboard = value;
    });
  }

  @override
  String toString() {
    return '''
clipboard: ${clipboard}
    ''';
  }
}
