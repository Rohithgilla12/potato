import 'package:crispin/crispin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:potato/src/data/auth_api.dart';
import 'package:potato/src/init/init.dart';
import 'package:potato/src/models/index.dart';
import 'package:potato/src/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final StateProvider<String?> nameProvider = StateProvider<String?>((ref) => null);

final StateProvider<UserProfile?> userProfileProvider = StateProvider<UserProfile?>((ref) => null);

final StateProvider<GotrueSubscription?> authSubscriptionProvider = StateProvider<GotrueSubscription?>((ref) => null);

final FutureProvider<UserProfile?> userProfileFutureProvider = FutureProvider<UserProfile?>((ref) async {
  final String? uid = ref.watch(uidProvider);
  if (uid == null) {
    return null;
  }
  final UserProfile userProfile = await ref.read(authApiProvider).getUser(uid);
  ref.read(userProfileProvider.notifier).state = userProfile;
  return userProfile;
});

final StateNotifierProvider<AuthController, UserProfile?> authControllerProvider = StateNotifierProvider<AuthController, UserProfile?>((ref) {
  return AuthController(ref.read);
});

// todo: Covert `UserProfile?` to a `AuthState` model
class AuthController extends StateNotifier<UserProfile?> {
  AuthController(this.read) : super(null);

  final Reader read;

  final AuthApi authApi = AuthApi();

  void listenToAuth() {
    final GotrueSubscription authSubscription = auth.onAuthStateChange((AuthChangeEvent event, Session? session) {
      if (session?.user?.id != null) {
        getUser(session!.user!.id);
      }
      Crispin().info('Updaing current user in listen to ${auth.currentUser?.id ?? 'No current user'}');
      Crispin().info(event.toString());
      Crispin().info(auth.currentSession?.user?.id ?? 'No session');
      Crispin().info(auth.currentUser?.id ?? 'No current user');
    });
    SupabaseAuth.instance.onAuthChange.listen((AuthChangeEvent event) {
      Crispin().info(event.toString());
      Crispin().info('Updaing current user in listen to ${auth.currentUser?.id ?? 'No current user'}');
      final String? uid = auth.currentUser?.id;
      read(uidProvider.notifier).state = uid;
      if (uid != null) {
        getUser(uid);
      }
      Crispin().info(auth.currentSession?.user?.id ?? 'No session');
      Crispin().info(auth.currentUser?.id ?? 'No current user');
    });
    read(authSubscriptionProvider.notifier).state = authSubscription;
  }

  Future<void> signUp(String email, String password) async {
    await auth.signUp(email, password);
  }

  Future<void> loginWithMagicLink(String email) async {
    await auth.signIn(
      email: email,
      options: const AuthOptions(
        redirectTo: 'potato://login-callback',
      ),
    );
  }

  Future<void> loginWithPassword(String email, String password) async {
    await auth.signIn(email: email, password: password);
  }

  Future<void> getUser(String uid) async {
    final UserProfile userProfile = await authApi.getUser(uid);
    state = userProfile;
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
