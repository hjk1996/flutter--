// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  @JsonKey(name: 'adjacent_words')
  List<dynamic> get adjacentWords => throw _privateConstructorUsedError;
  bool get killer => throw _privateConstructorUsedError;
  List<String> get meanings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'adjacent_words') List<dynamic> adjacentWords,
      bool killer,
      List<String> meanings});
}

/// @nodoc
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  final Word _value;
  // ignore: unused_field
  final $Res Function(Word) _then;

  @override
  $Res call({
    Object? adjacentWords = freezed,
    Object? killer = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_value.copyWith(
      adjacentWords: adjacentWords == freezed
          ? _value.adjacentWords
          : adjacentWords // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      killer: killer == freezed
          ? _value.killer
          : killer // ignore: cast_nullable_to_non_nullable
              as bool,
      meanings: meanings == freezed
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'adjacent_words') List<dynamic> adjacentWords,
      bool killer,
      List<String> meanings});
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, (v) => _then(v as _$_Word));

  @override
  _$_Word get _value => super._value as _$_Word;

  @override
  $Res call({
    Object? adjacentWords = freezed,
    Object? killer = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_$_Word(
      adjacentWords: adjacentWords == freezed
          ? _value._adjacentWords
          : adjacentWords // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      killer: killer == freezed
          ? _value.killer
          : killer // ignore: cast_nullable_to_non_nullable
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
class _$_Word implements _Word {
  _$_Word(
      {@JsonKey(name: 'adjacent_words')
          required final List<dynamic> adjacentWords,
      required this.killer,
      required final List<String> meanings})
      : _adjacentWords = adjacentWords,
        _meanings = meanings;

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  final List<dynamic> _adjacentWords;
  @override
  @JsonKey(name: 'adjacent_words')
  List<dynamic> get adjacentWords {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adjacentWords);
  }

  @override
  final bool killer;
  final List<String> _meanings;
  @override
  List<String> get meanings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  @override
  String toString() {
    return 'Word(adjacentWords: $adjacentWords, killer: $killer, meanings: $meanings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            const DeepCollectionEquality()
                .equals(other._adjacentWords, _adjacentWords) &&
            const DeepCollectionEquality().equals(other.killer, killer) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_adjacentWords),
      const DeepCollectionEquality().hash(killer),
      const DeepCollectionEquality().hash(_meanings));

  @JsonKey(ignore: true)
  @override
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(
      this,
    );
  }
}

abstract class _Word implements Word {
  factory _Word(
      {@JsonKey(name: 'adjacent_words')
          required final List<dynamic> adjacentWords,
      required final bool killer,
      required final List<String> meanings}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  @JsonKey(name: 'adjacent_words')
  List<dynamic> get adjacentWords;
  @override
  bool get killer;
  @override
  List<String> get meanings;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}
