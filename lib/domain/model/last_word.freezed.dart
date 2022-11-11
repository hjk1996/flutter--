// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'last_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastWord _$LastWordFromJson(Map<String, dynamic> json) {
  return _LastWord.fromJson(json);
}

/// @nodoc
mixin _$LastWord {
  @JsonKey(name: 'following_words')
  List<FollowingWord> get followingWords => throw _privateConstructorUsedError;
  bool get killer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastWordCopyWith<LastWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastWordCopyWith<$Res> {
  factory $LastWordCopyWith(LastWord value, $Res Function(LastWord) then) =
      _$LastWordCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'following_words') List<FollowingWord> followingWords,
      bool killer});
}

/// @nodoc
class _$LastWordCopyWithImpl<$Res> implements $LastWordCopyWith<$Res> {
  _$LastWordCopyWithImpl(this._value, this._then);

  final LastWord _value;
  // ignore: unused_field
  final $Res Function(LastWord) _then;

  @override
  $Res call({
    Object? followingWords = freezed,
    Object? killer = freezed,
  }) {
    return _then(_value.copyWith(
      followingWords: followingWords == freezed
          ? _value.followingWords
          : followingWords // ignore: cast_nullable_to_non_nullable
              as List<FollowingWord>,
      killer: killer == freezed
          ? _value.killer
          : killer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_LastWordCopyWith<$Res> implements $LastWordCopyWith<$Res> {
  factory _$$_LastWordCopyWith(
          _$_LastWord value, $Res Function(_$_LastWord) then) =
      __$$_LastWordCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'following_words') List<FollowingWord> followingWords,
      bool killer});
}

/// @nodoc
class __$$_LastWordCopyWithImpl<$Res> extends _$LastWordCopyWithImpl<$Res>
    implements _$$_LastWordCopyWith<$Res> {
  __$$_LastWordCopyWithImpl(
      _$_LastWord _value, $Res Function(_$_LastWord) _then)
      : super(_value, (v) => _then(v as _$_LastWord));

  @override
  _$_LastWord get _value => super._value as _$_LastWord;

  @override
  $Res call({
    Object? followingWords = freezed,
    Object? killer = freezed,
  }) {
    return _then(_$_LastWord(
      followingWords: followingWords == freezed
          ? _value._followingWords
          : followingWords // ignore: cast_nullable_to_non_nullable
              as List<FollowingWord>,
      killer: killer == freezed
          ? _value.killer
          : killer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastWord implements _LastWord {
  _$_LastWord(
      {@JsonKey(name: 'following_words')
          required final List<FollowingWord> followingWords,
      required this.killer})
      : _followingWords = followingWords;

  factory _$_LastWord.fromJson(Map<String, dynamic> json) =>
      _$$_LastWordFromJson(json);

  final List<FollowingWord> _followingWords;
  @override
  @JsonKey(name: 'following_words')
  List<FollowingWord> get followingWords {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followingWords);
  }

  @override
  final bool killer;

  @override
  String toString() {
    return 'LastWord(followingWords: $followingWords, killer: $killer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastWord &&
            const DeepCollectionEquality()
                .equals(other._followingWords, _followingWords) &&
            const DeepCollectionEquality().equals(other.killer, killer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_followingWords),
      const DeepCollectionEquality().hash(killer));

  @JsonKey(ignore: true)
  @override
  _$$_LastWordCopyWith<_$_LastWord> get copyWith =>
      __$$_LastWordCopyWithImpl<_$_LastWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastWordToJson(
      this,
    );
  }
}

abstract class _LastWord implements LastWord {
  factory _LastWord(
      {@JsonKey(name: 'following_words')
          required final List<FollowingWord> followingWords,
      required final bool killer}) = _$_LastWord;

  factory _LastWord.fromJson(Map<String, dynamic> json) = _$_LastWord.fromJson;

  @override
  @JsonKey(name: 'following_words')
  List<FollowingWord> get followingWords;
  @override
  bool get killer;
  @override
  @JsonKey(ignore: true)
  _$$_LastWordCopyWith<_$_LastWord> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingWord _$FollowingWordFromJson(Map<String, dynamic> json) {
  return _FollowingWord.fromJson(json);
}

/// @nodoc
mixin _$FollowingWord {
  String get word => throw _privateConstructorUsedError;
  bool get killer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingWordCopyWith<FollowingWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingWordCopyWith<$Res> {
  factory $FollowingWordCopyWith(
          FollowingWord value, $Res Function(FollowingWord) then) =
      _$FollowingWordCopyWithImpl<$Res>;
  $Res call({String word, bool killer});
}

/// @nodoc
class _$FollowingWordCopyWithImpl<$Res>
    implements $FollowingWordCopyWith<$Res> {
  _$FollowingWordCopyWithImpl(this._value, this._then);

  final FollowingWord _value;
  // ignore: unused_field
  final $Res Function(FollowingWord) _then;

  @override
  $Res call({
    Object? word = freezed,
    Object? killer = freezed,
  }) {
    return _then(_value.copyWith(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      killer: killer == freezed
          ? _value.killer
          : killer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FollowingWordCopyWith<$Res>
    implements $FollowingWordCopyWith<$Res> {
  factory _$$_FollowingWordCopyWith(
          _$_FollowingWord value, $Res Function(_$_FollowingWord) then) =
      __$$_FollowingWordCopyWithImpl<$Res>;
  @override
  $Res call({String word, bool killer});
}

/// @nodoc
class __$$_FollowingWordCopyWithImpl<$Res>
    extends _$FollowingWordCopyWithImpl<$Res>
    implements _$$_FollowingWordCopyWith<$Res> {
  __$$_FollowingWordCopyWithImpl(
      _$_FollowingWord _value, $Res Function(_$_FollowingWord) _then)
      : super(_value, (v) => _then(v as _$_FollowingWord));

  @override
  _$_FollowingWord get _value => super._value as _$_FollowingWord;

  @override
  $Res call({
    Object? word = freezed,
    Object? killer = freezed,
  }) {
    return _then(_$_FollowingWord(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      killer: killer == freezed
          ? _value.killer
          : killer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FollowingWord implements _FollowingWord {
  _$_FollowingWord({required this.word, required this.killer});

  factory _$_FollowingWord.fromJson(Map<String, dynamic> json) =>
      _$$_FollowingWordFromJson(json);

  @override
  final String word;
  @override
  final bool killer;

  @override
  String toString() {
    return 'FollowingWord(word: $word, killer: $killer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowingWord &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality().equals(other.killer, killer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(killer));

  @JsonKey(ignore: true)
  @override
  _$$_FollowingWordCopyWith<_$_FollowingWord> get copyWith =>
      __$$_FollowingWordCopyWithImpl<_$_FollowingWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowingWordToJson(
      this,
    );
  }
}

abstract class _FollowingWord implements FollowingWord {
  factory _FollowingWord(
      {required final String word,
      required final bool killer}) = _$_FollowingWord;

  factory _FollowingWord.fromJson(Map<String, dynamic> json) =
      _$_FollowingWord.fromJson;

  @override
  String get word;
  @override
  bool get killer;
  @override
  @JsonKey(ignore: true)
  _$$_FollowingWordCopyWith<_$_FollowingWord> get copyWith =>
      throw _privateConstructorUsedError;
}
