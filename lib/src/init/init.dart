import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
}
