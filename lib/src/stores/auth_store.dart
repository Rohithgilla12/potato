import 'package:crispin/crispin.dart';
import 'package:mobx/mobx.dart';
import 'package:potato/src/data/auth_api.dart';
import 'package:potato/src/models/auth/index.dart';
import 'package:potato/src/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  GotrueSubscription? authSubscription;

  @observable
  String? uid;

  @observable
  UserProfile? userProfile;

  @observable
  String? name;

  @observable
  ObservableFuture<UserProfile>? userProfileFuture;

  final AuthApi authApi = AuthApi();

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

  @action
  Future<void> getUser(String uid) async {
    final Future<UserProfile> userProfFuture = authApi.getUser(uid);
    userProfileFuture = ObservableFuture(userProfFuture);
    userProfile = await userProfileFuture;
    //await authApi.getUser(uid);
  }

  @action
  Future<void> createInitialProfile() async {
    userProfile = UserProfile(
      name: name,
      email: auth.currentSession!.user!.email!,
      id: uid!,
    );
    await authApi.createProfile(userProfile!);
  }
}
