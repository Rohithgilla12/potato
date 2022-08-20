// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of clipboard_models;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PClipboard _$PClipboardFromJson(Map<String, dynamic> json) {
  return _PClipboard.fromJson(json);
}

/// @nodoc
mixin _$PClipboard {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PClipboardCopyWith<PClipboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PClipboardCopyWith<$Res> {
  factory $PClipboardCopyWith(
          PClipboard value, $Res Function(PClipboard) then) =
      _$PClipboardCopyWithImpl<$Res>;
  $Res call({String id, String text, String mimeType});
}

/// @nodoc
class _$PClipboardCopyWithImpl<$Res> implements $PClipboardCopyWith<$Res> {
  _$PClipboardCopyWithImpl(this._value, this._then);

  final PClipboard _value;
  // ignore: unused_field
  final $Res Function(PClipboard) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PClipboardCopyWith<$Res>
    implements $PClipboardCopyWith<$Res> {
  factory _$$_PClipboardCopyWith(
          _$_PClipboard value, $Res Function(_$_PClipboard) then) =
      __$$_PClipboardCopyWithImpl<$Res>;
  @override
  $Res call({String id, String text, String mimeType});
}

/// @nodoc
class __$$_PClipboardCopyWithImpl<$Res> extends _$PClipboardCopyWithImpl<$Res>
    implements _$$_PClipboardCopyWith<$Res> {
  __$$_PClipboardCopyWithImpl(
      _$_PClipboard _value, $Res Function(_$_PClipboard) _then)
      : super(_value, (v) => _then(v as _$_PClipboard));

  @override
  _$_PClipboard get _value => super._value as _$_PClipboard;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_$_PClipboard(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PClipboard implements _PClipboard {
  const _$_PClipboard(
      {required this.id, required this.text, this.mimeType = 'text/plain'});

  factory _$_PClipboard.fromJson(Map<String, dynamic> json) =>
      _$$_PClipboardFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  @JsonKey()
  final String mimeType;

  @override
  String toString() {
    return 'PClipboard(id: $id, text: $text, mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PClipboard &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.mimeType, mimeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(mimeType));

  @JsonKey(ignore: true)
  @override
  _$$_PClipboardCopyWith<_$_PClipboard> get copyWith =>
      __$$_PClipboardCopyWithImpl<_$_PClipboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PClipboardToJson(
      this,
    );
  }
}

abstract class _PClipboard implements PClipboard {
  const factory _PClipboard(
      {required final String id,
      required final String text,
      final String mimeType}) = _$_PClipboard;

  factory _PClipboard.fromJson(Map<String, dynamic> json) =
      _$_PClipboard.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get mimeType;
  @override
  @JsonKey(ignore: true)
  _$$_PClipboardCopyWith<_$_PClipboard> get copyWith =>
      throw _privateConstructorUsedError;
}
