part of notes_models;

@freezed
class Note with _$Note {
  const factory Note({
    required String id,
    required String? fid,
    required String uid,
    required String? title,
    required String? description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
