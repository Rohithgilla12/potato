import 'package:crispin/crispin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger_crispin_transport/logger_crispin_transport.dart';
import 'package:potato/src/init/locator.dart';
import 'package:potato/src/stores/app_store.dart';
import 'package:potato/src/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  );

  setupLocator();

  final AppStore appStore = locator<AppStore>();

  // Setup loggers
  Crispin().addTransport(LoggerCrispinTransport(
    LoggerCrispinTransportOptions(
      level: 'info',
    ),
  ));

  appStore.auth.listenToAuth();

  // Hacky way to do for now.
  appStore.auth.uid = auth.currentSession?.user?.id;
  if (appStore.auth.uid != null) {
    await appStore.auth.getUser(appStore.auth.uid!);
  }
}
