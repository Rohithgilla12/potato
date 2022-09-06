import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:potato/src/data/auth_api.dart';
import 'package:potato/src/models/index.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final StateProvider<String?> uidProvider = StateProvider<String?>((ref) => null);

final StateProvider<String?> nameProvider = StateProvider<String?>((ref) => null);

final StateProvider<UserProfile?> userProfileProvider = StateProvider<UserProfile?>((ref) => null);

final StateProvider<GotrueSubscription?> authSubscriptionProvider = StateProvider<GotrueSubscription?>((ref) => null);

final userProfileFutureProvider = FutureProvider<UserProfile?>((ref) async {
  final String? uid = ref.watch(uidProvider);
  if (uid == null) {
    return null;
  }
  final UserProfile userProfile = await ref.read(authApiProvider).getUser(uid);
  ref.read(userProfileProvider.notifier).state = userProfile;
  return userProfile;
});
