part of clipboard_models;

@freezed
class PClipboard with _$PClipboard {
  const factory PClipboard({
    required String id,
    required String text,
    @Default('text/plain') String mimeType,
  }) = _PClipboard;

  factory PClipboard.fromJson(Map<String, dynamic> json) => _$PClipboardFromJson(json);
}
