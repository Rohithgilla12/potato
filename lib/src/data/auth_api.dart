import 'package:crispin/crispin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:potato/src/models/auth/index.dart';
import 'package:potato/src/utils/supabase.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi();
});

class AuthApi {
  Future<UserProfile> getUser(String uid) async {
    try {
      final response = await supabase //
          .from('user_profiles')
          .select()
          .eq('id', uid);

      Crispin().info(response.toString());
      return UserProfile.fromJson(response.first);
    } catch (e) {
      Crispin().error(e.toString());
      throw Exception(e);
    }
  }

  Future<void> createProfile(UserProfile userProfile) async {
    try {
      final response = await supabase //
          .from('user_profiles')
          .insert(userProfile.toJson());

      Crispin().info(response.toString());
    } catch (e) {
      Crispin().error(e.toString(), error: e);
      throw Exception(e);
    }
  }
}
