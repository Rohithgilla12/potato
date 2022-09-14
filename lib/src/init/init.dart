import 'package:crispin/crispin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger_crispin_transport/logger_crispin_transport.dart';
import 'package:potato/src/data/auth_api.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/auth_provider.dart';
import 'package:potato/src/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// user flutter_secure_storage to persist user session
class SecureLocalStorage extends LocalStorage {
  SecureLocalStorage()
      : super(
          initialize: () async {},
          hasAccessToken: () {
            const storage = FlutterSecureStorage();
            return storage.containsKey(key: supabasePersistSessionKey);
          },
          accessToken: () {
            const storage = FlutterSecureStorage();
            return storage.read(key: supabasePersistSessionKey);
          },
          removePersistedSession: () {
            const storage = FlutterSecureStorage();
            return storage.delete(key: supabasePersistSessionKey);
          },
          persistSession: (String value) {
            const storage = FlutterSecureStorage();
            return storage.write(key: supabasePersistSessionKey, value: value);
          },
        );
}

late StateProvider<String?> uidProvider;

Future<void> init() async {
  await dotenv.load();

  final String? supbaseUrl = dotenv.maybeGet('SUPABASE_URL');
  final String? supabaseAnonKey = dotenv.maybeGet('SUPABASE_ANON_KEY');

  if (supbaseUrl == null || supabaseAnonKey == null) {
    throw Exception('Missing SUPBASE_URL or SUPBASE_ANON_KEY');
  }

  await Supabase.initialize(
    url: supbaseUrl,
    anonKey: supabaseAnonKey,
    debug: kDebugMode,
    authCallbackUrlHostname: 'login-callback',
    localStorage: SecureLocalStorage(),
  );

  setupLocator();

  // final AppStore appStore = locator<AppStore>();

  // Setup loggers
  Crispin().addTransport(LoggerCrispinTransport(
    LoggerCrispinTransportOptions(
      level: 'info',
    ),
  ));

  // appStore.auth.listenToAuth();

  // Hacky way to do for now.
  uidProvider = StateProvider<String?>((ref) {
    final String? uid = auth.currentSession?.user?.id;
    if (uid != null) {
      ref.read(authApiProvider).getUser(uid);
    }
    ref.read(authControllerProvider.notifier).listenToAuth();
    return auth.currentSession?.user?.id;
  });

  // appStore.auth.uid = auth.currentSession?.user?.id;
  // if (appStore.auth.uid != null) {
  //   await appStore.auth.getUser(appStore.auth.uid!);
  // }
}
