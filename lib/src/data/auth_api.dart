import 'package:crispin/crispin.dart';
import 'package:potato/src/models/auth/index.dart';
import 'package:potato/src/utils/supabase.dart';

class AuthApi {
  Future<void> getUser(String uid) async {
    final response = await supabase //
        .from('user_profiles')
        .select()
        .eq('id', uid);

    Crispin().info(response.toString());
  }

  Future<void> createProfile(UserProfile userProfile) async {
    try {
      final response = await supabase //
          .from('user_profiles')
          .insert(userProfile.toJson());
      Crispin().info(response.toString());
    } catch (e) {
      Crispin().error(e.toString(), error: e);
    }
  }
}
