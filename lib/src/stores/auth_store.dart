import 'package:crispin/crispin.dart';
import 'package:mobx/mobx.dart';
import 'package:potato/src/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  GotrueSubscription? authSubscription;

  @observable
  String? uid;

  @action
  void listenToAuth() {
    authSubscription = auth.onAuthStateChange((AuthChangeEvent event, Session? session) {
      // uid = session?.user?.id;
      Crispin().info('Updaing current user in listen to ${auth.currentUser?.id ?? 'No current user'}');
      Crispin().info(event.toString());
      Crispin().info(auth.currentSession?.user?.id ?? 'No session');
      Crispin().info(auth.currentUser?.id ?? 'No current user');
    });
    SupabaseAuth.instance.onAuthChange.listen((AuthChangeEvent event) {
      Crispin().info(event.toString());
      Crispin().info('Updaing current user in listen to ${auth.currentUser?.id ?? 'No current user'}');
      uid = auth.currentUser?.id;
      Crispin().info(auth.currentSession?.user?.id ?? 'No session');
      Crispin().info(auth.currentUser?.id ?? 'No current user');
    });
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
