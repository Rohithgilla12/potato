// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  late final _$uidAtom = Atom(name: 'AuthStoreBase.uid', context: context);

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

  late final _$userProfileAtom =
      Atom(name: 'AuthStoreBase.userProfile', context: context);

  @override
  UserProfile? get userProfile {
    _$userProfileAtom.reportRead();
    return super.userProfile;
  }

  @override
  set userProfile(UserProfile? value) {
    _$userProfileAtom.reportWrite(value, super.userProfile, () {
      super.userProfile = value;
    });
  }

  late final _$nameAtom = Atom(name: 'AuthStoreBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$userProfileFutureAtom =
      Atom(name: 'AuthStoreBase.userProfileFuture', context: context);

  @override
  ObservableFuture<UserProfile>? get userProfileFuture {
    _$userProfileFutureAtom.reportRead();
    return super.userProfileFuture;
  }

  @override
  set userProfileFuture(ObservableFuture<UserProfile>? value) {
    _$userProfileFutureAtom.reportWrite(value, super.userProfileFuture, () {
      super.userProfileFuture = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('AuthStoreBase.signUp', context: context);

  @override
  Future<void> signUp(String email, String password) {
    return _$signUpAsyncAction.run(() => super.signUp(email, password));
  }

  late final _$loginWithMagicLinkAsyncAction =
      AsyncAction('AuthStoreBase.loginWithMagicLink', context: context);

  @override
  Future<void> loginWithMagicLink(String email) {
    return _$loginWithMagicLinkAsyncAction
        .run(() => super.loginWithMagicLink(email));
  }

  late final _$getUserAsyncAction =
      AsyncAction('AuthStoreBase.getUser', context: context);

  @override
  Future<void> getUser(String uid) {
    return _$getUserAsyncAction.run(() => super.getUser(uid));
  }

  late final _$createInitialProfileAsyncAction =
      AsyncAction('AuthStoreBase.createInitialProfile', context: context);

  @override
  Future<void> createInitialProfile() {
    return _$createInitialProfileAsyncAction
        .run(() => super.createInitialProfile());
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  void listenToAuth() {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.listenToAuth');
    try {
      return super.listenToAuth();
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uid: ${uid},
userProfile: ${userProfile},
name: ${name},
userProfileFuture: ${userProfileFuture}
    ''';
  }
}
