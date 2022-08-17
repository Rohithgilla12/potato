// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  late final _$uidAtom = Atom(name: '_AuthStore.uid', context: context);

  @override
  String? get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String? value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  late final _$signUpAsyncAction = AsyncAction('_AuthStore.signUp', context: context);

  @override
  Future<void> signUp(String email, String password) {
    return _$signUpAsyncAction.run(() => super.signUp(email, password));
  }

  late final _$loginWithMagicLinkAsyncAction = AsyncAction('_AuthStore.loginWithMagicLink', context: context);

  @override
  Future<void> loginWithMagicLink(String email) {
    return _$loginWithMagicLinkAsyncAction.run(() => super.loginWithMagicLink(email));
  }

  late final _$_AuthStoreActionController = ActionController(name: '_AuthStore', context: context);

  @override
  void listenToAuth() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(name: '_AuthStore.listenToAuth');
    try {
      return super.listenToAuth();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uid: ${uid}
    ''';
  }
}
