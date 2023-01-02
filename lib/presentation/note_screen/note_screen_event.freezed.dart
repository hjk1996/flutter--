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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onSortButtonPressed,
    required TResult Function(String word) onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSortButtonPressed,
    TResult Function(String word)? onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onSortButtonPressed,
    TResult Function(String word)? onDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSortButtonPressed value) onSortButtonPressed,
    required TResult Function(OnDelete value) onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSortButtonPressed value)? onSortButtonPressed,
    TResult Function(OnDelete value)? onDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSortButtonPressed value)? onSortButtonPressed,
    TResult Function(OnDelete value)? onDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteScreenEventCopyWith<$Res> {
  factory $NoteScreenEventCopyWith(
          NoteScreenEvent value, $Res Function(NoteScreenEvent) then) =
      _$NoteScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteScreenEventCopyWithImpl<$Res>
    implements $NoteScreenEventCopyWith<$Res> {
  _$NoteScreenEventCopyWithImpl(this._value, this._then);

  final NoteScreenEvent _value;
  // ignore: unused_field
  final $Res Function(NoteScreenEvent) _then;
}

/// @nodoc
abstract class _$$OnSortButtonPressedCopyWith<$Res> {
  factory _$$OnSortButtonPressedCopyWith(_$OnSortButtonPressed value,
          $Res Function(_$OnSortButtonPressed) then) =
      __$$OnSortButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSortButtonPressedCopyWithImpl<$Res>
    extends _$NoteScreenEventCopyWithImpl<$Res>
    implements _$$OnSortButtonPressedCopyWith<$Res> {
  __$$OnSortButtonPressedCopyWithImpl(
      _$OnSortButtonPressed _value, $Res Function(_$OnSortButtonPressed) _then)
      : super(_value, (v) => _then(v as _$OnSortButtonPressed));

  @override
  _$OnSortButtonPressed get _value => super._value as _$OnSortButtonPressed;
}

/// @nodoc

class _$OnSortButtonPressed implements OnSortButtonPressed {
  const _$OnSortButtonPressed();

  @override
  String toString() {
    return 'NoteScreenEvent.onSortButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSortButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onSortButtonPressed,
    required TResult Function(String word) onDelete,
  }) {
    return onSortButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSortButtonPressed,
    TResult Function(String word)? onDelete,
  }) {
    return onSortButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onSortButtonPressed,
    TResult Function(String word)? onDelete,
    required TResult orElse(),
  }) {
    if (onSortButtonPressed != null) {
      return onSortButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSortButtonPressed value) onSortButtonPressed,
    required TResult Function(OnDelete value) onDelete,
  }) {
    return onSortButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSortButtonPressed value)? onSortButtonPressed,
    TResult Function(OnDelete value)? onDelete,
  }) {
    return onSortButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSortButtonPressed value)? onSortButtonPressed,
    TResult Function(OnDelete value)? onDelete,
    required TResult orElse(),
  }) {
    if (onSortButtonPressed != null) {
      return onSortButtonPressed(this);
    }
    return orElse();
  }
}

abstract class OnSortButtonPressed implements NoteScreenEvent {
  const factory OnSortButtonPressed() = _$OnSortButtonPressed;
}

/// @nodoc
abstract class _$$OnDeleteCopyWith<$Res> {
  factory _$$OnDeleteCopyWith(
          _$OnDelete value, $Res Function(_$OnDelete) then) =
      __$$OnDeleteCopyWithImpl<$Res>;
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
    required TResult Function() onSortButtonPressed,
    required TResult Function(String word) onDelete,
  }) {
    return onDelete(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSortButtonPressed,
    TResult Function(String word)? onDelete,
  }) {
    return onDelete?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onSortButtonPressed,
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
    required TResult Function(OnSortButtonPressed value) onSortButtonPressed,
    required TResult Function(OnDelete value) onDelete,
  }) {
    return onDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSortButtonPressed value)? onSortButtonPressed,
    TResult Function(OnDelete value)? onDelete,
  }) {
    return onDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSortButtonPressed value)? onSortButtonPressed,
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

  String get word;
  @JsonKey(ignore: true)
  _$$OnDeleteCopyWith<_$OnDelete> get copyWith =>
      throw _privateConstructorUsedError;
}
