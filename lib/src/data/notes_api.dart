import 'package:crispin/crispin.dart';
import 'package:potato/src/utils/supabase.dart';

class NotesApi {
  static const String tableName = 'user_notes';

  Future<void> createNote({
    String? title,
    String? description,
  }) async {
    try {
      final response = await supabase.from(tableName).insert({
        'title': title,
        'description': description,
      });

      Crispin().info('createNote response: $response');
    } catch (e) {
      Crispin().error(e.toString(), error: e);
      throw Exception(e);
    }
  }

  Future<void> getUserNotes(String uid) async {
    try {
      final response = await supabase.from(tableName).select().eq('uid', uid);
      Crispin().info('getUserNotes response: $response');
    } catch (e) {
      Crispin().error(e.toString(), error: e);
      throw Exception(e);
    }
  }
}
