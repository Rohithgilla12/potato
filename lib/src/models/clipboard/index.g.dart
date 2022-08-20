// GENERATED CODE - DO NOT MODIFY BY HAND

part of clipboard_models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PClipboard _$$_PClipboardFromJson(Map<String, dynamic> json) =>
    _$_PClipboard(
      id: json['id'] as String,
      text: json['text'] as String,
      mimeType: json['mimeType'] as String? ?? 'text/plain',
    );

Map<String, dynamic> _$$_PClipboardToJson(_$_PClipboard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'mimeType': instance.mimeType,
    };
