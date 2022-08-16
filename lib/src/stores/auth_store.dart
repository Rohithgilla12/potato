import 'package:mobx/mobx.dart';
import 'package:potato/src/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  GotrueSubscription? authSubscription;

  @observable
  User? user;

  @action
  void listenToAuth() {
    authSubscription = auth.onAuthStateChange((AuthChangeEvent event, Session? session) {
      user = session?.user;
    });
  }

  @action
  Future<void> signUp(String email, String password) async {
    await auth.signUp(email, password);
  }
}
