// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteScreenEvent {
  String get word => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? onDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnDelete value) onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnDelete value)? onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnDelete value)? onDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteScreenEventCopyWith<NoteScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteScreenEventCopyWith<$Res> {
  factory $NoteScreenEventCopyWith(
          NoteScreenEvent value, $Res Function(NoteScreenEvent) then) =
      _$NoteScreenEventCopyWithImpl<$Res>;
  $Res call({String word});
}

/// @nodoc
class _$NoteScreenEventCopyWithImpl<$Res>
    implements $NoteScreenEventCopyWith<$Res> {
  _$NoteScreenEventCopyWithImpl(this._value, this._then);

  final NoteScreenEvent _value;
  // ignore: unused_field
  final $Res Function(NoteScreenEvent) _then;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(_value.copyWith(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$OnDeleteCopyWith<$Res>
    implements $NoteScreenEventCopyWith<$Res> {
  factory _$$OnDeleteCopyWith(
          _$OnDelete value, $Res Function(_$OnDelete) then) =
      __$$OnDeleteCopyWithImpl<$Res>;
  @override
  $Res call({String word});
}

/// @nodoc
class __$$OnDeleteCopyWithImpl<$Res> extends _$NoteScreenEventCopyWithImpl<$Res>
    implements _$$OnDeleteCopyWith<$Res> {
  __$$OnDeleteCopyWithImpl(_$OnDelete _value, $Res Function(_$OnDelete) _then)
      : super(_value, (v) => _then(v as _$OnDelete));

  @override
  _$OnDelete get _value => super._value as _$OnDelete;

  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(_$OnDelete(
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnDelete implements OnDelete {
  const _$OnDelete(this.word);

  @override
  final String word;

  @override
  String toString() {
    return 'NoteScreenEvent.onDelete(word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDelete &&
            const DeepCollectionEquality().equals(other.word, word));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(word));

  @JsonKey(ignore: true)
  @override
  _$$OnDeleteCopyWith<_$OnDelete> get copyWith =>
      __$$OnDeleteCopyWithImpl<_$OnDelete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) onDelete,
  }) {
    return onDelete(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String word)? onDelete,
  }) {
    return onDelete?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? onDelete,
    required TResult orElse(),
  }) {
    if (onDelete != null) {
      return onDelete(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnDelete value) onDelete,
  }) {
    return onDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnDelete value)? onDelete,
  }) {
    return onDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnDelete value)? onDelete,
    required TResult orElse(),
  }) {
    if (onDelete != null) {
      return onDelete(this);
    }
    return orElse();
  }
}

abstract class OnDelete implements NoteScreenEvent {
  const factory OnDelete(final String word) = _$OnDelete;

  @override
  String get word;
  @override
  @JsonKey(ignore: true)
  _$$OnDeleteCopyWith<_$OnDelete> get copyWith =>
      throw _privateConstructorUsedError;
}
