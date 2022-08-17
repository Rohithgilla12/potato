// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$userAtom = Atom(name: '_AuthStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthStore.signUp', context: context);

  @override
  Future<void> signUp(String email, String password) {
    return _$signUpAsyncAction.run(() => super.signUp(email, password));
  }

  late final _$loginWithMagicLinkAsyncAction =
      AsyncAction('_AuthStore.loginWithMagicLink', context: context);

  @override
  Future<void> loginWithMagicLink(String email) {
    return _$loginWithMagicLinkAsyncAction
        .run(() => super.loginWithMagicLink(email));
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void listenToAuth() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.listenToAuth');
    try {
      return super.listenToAuth();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
