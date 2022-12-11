// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteItem _$NoteItemFromJson(Map<String, dynamic> json) {
  return _NoteItem.fromJson(json);
}

/// @nodoc
mixin _$NoteItem {
  String get word => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  List<String> get meanings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteItemCopyWith<NoteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteItemCopyWith<$Res> {
  factory $NoteItemCopyWith(NoteItem value, $Res Function(NoteItem) then) =
      _$NoteItemCopyWithImpl<$Res>;
  $Res call({String word, bool isFavorite, List<String> meanings});
}

/// @nodoc
class _$NoteItemCopyWithImpl<$Res> implements $NoteItemCopyWith<$Res> {
  _$NoteItemCopyWithImpl(this._value, this._then);

  final NoteItem _value;
  // ignore: unused_field
  final $Res Function(NoteItem) _then;

  @override
  $Res call({
    Object? word = freezed,
    Object? isFavorite = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_value.copyWith(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      meanings: meanings == freezed
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_NoteItemCopyWith<$Res> implements $NoteItemCopyWith<$Res> {
  factory _$$_NoteItemCopyWith(
          _$_NoteItem value, $Res Function(_$_NoteItem) then) =
      __$$_NoteItemCopyWithImpl<$Res>;
  @override
  $Res call({String word, bool isFavorite, List<String> meanings});
}

/// @nodoc
class __$$_NoteItemCopyWithImpl<$Res> extends _$NoteItemCopyWithImpl<$Res>
    implements _$$_NoteItemCopyWith<$Res> {
  __$$_NoteItemCopyWithImpl(
      _$_NoteItem _value, $Res Function(_$_NoteItem) _then)
      : super(_value, (v) => _then(v as _$_NoteItem));

  @override
  _$_NoteItem get _value => super._value as _$_NoteItem;

  @override
  $Res call({
    Object? word = freezed,
    Object? isFavorite = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_$_NoteItem(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      meanings: meanings == freezed
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteItem implements _NoteItem {
  _$_NoteItem(
      {required this.word,
      required this.isFavorite,
      required final List<String> meanings})
      : _meanings = meanings;

  factory _$_NoteItem.fromJson(Map<String, dynamic> json) =>
      _$$_NoteItemFromJson(json);

  @override
  final String word;
  @override
  final bool isFavorite;
  final List<String> _meanings;
  @override
  List<String> get meanings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  @override
  String toString() {
    return 'NoteItem(word: $word, isFavorite: $isFavorite, meanings: $meanings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteItem &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(isFavorite),
      const DeepCollectionEquality().hash(_meanings));

  @JsonKey(ignore: true)
  @override
  _$$_NoteItemCopyWith<_$_NoteItem> get copyWith =>
      __$$_NoteItemCopyWithImpl<_$_NoteItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteItemToJson(
      this,
    );
  }
}

abstract class _NoteItem implements NoteItem {
  factory _NoteItem(
      {required final String word,
      required final bool isFavorite,
      required final List<String> meanings}) = _$_NoteItem;

  factory _NoteItem.fromJson(Map<String, dynamic> json) = _$_NoteItem.fromJson;

  @override
  String get word;
  @override
  bool get isFavorite;
  @override
  List<String> get meanings;
  @override
  @JsonKey(ignore: true)
  _$$_NoteItemCopyWith<_$_NoteItem> get copyWith =>
      throw _privateConstructorUsedError;
}
