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
      print(session);
      print(user);
      user = session?.user;
    });
    SupabaseAuth.instance.onAuthChange.listen((AuthChangeEvent event) {
      print(event);
    });

    print(auth.currentUser?.id);
  }

  @action
  Future<void> signUp(String email, String password) async {
    await auth.signUp(email, password);
  }

  @action
  Future<void> loginWithMagicLink(String email) async {
    await auth.signIn(
      email: email,
      options: const AuthOptions(
        redirectTo: 'potato://login-callback',
      ),
    );
  }
}
