// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameScreenEvent {
  RefereeResponse get response => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RefereeResponse response) onError,
    required TResult Function(RefereeResponse response) onGameEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RefereeResponse response)? onError,
    TResult Function(RefereeResponse response)? onGameEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RefereeResponse response)? onError,
    TResult Function(RefereeResponse response)? onGameEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnError value) onError,
    required TResult Function(OnGameEnd value) onGameEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnError value)? onError,
    TResult Function(OnGameEnd value)? onGameEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnError value)? onError,
    TResult Function(OnGameEnd value)? onGameEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameScreenEventCopyWith<GameScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameScreenEventCopyWith<$Res> {
  factory $GameScreenEventCopyWith(
          GameScreenEvent value, $Res Function(GameScreenEvent) then) =
      _$GameScreenEventCopyWithImpl<$Res>;
  $Res call({RefereeResponse response});
}

/// @nodoc
class _$GameScreenEventCopyWithImpl<$Res>
    implements $GameScreenEventCopyWith<$Res> {
  _$GameScreenEventCopyWithImpl(this._value, this._then);

  final GameScreenEvent _value;
  // ignore: unused_field
  final $Res Function(GameScreenEvent) _then;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as RefereeResponse,
    ));
  }
}

/// @nodoc
abstract class _$$OnErrorCopyWith<$Res>
    implements $GameScreenEventCopyWith<$Res> {
  factory _$$OnErrorCopyWith(_$OnError value, $Res Function(_$OnError) then) =
      __$$OnErrorCopyWithImpl<$Res>;
  @override
  $Res call({RefereeResponse response});
}

/// @nodoc
class __$$OnErrorCopyWithImpl<$Res> extends _$GameScreenEventCopyWithImpl<$Res>
    implements _$$OnErrorCopyWith<$Res> {
  __$$OnErrorCopyWithImpl(_$OnError _value, $Res Function(_$OnError) _then)
      : super(_value, (v) => _then(v as _$OnError));

  @override
  _$OnError get _value => super._value as _$OnError;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$OnError(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as RefereeResponse,
    ));
  }
}

/// @nodoc

class _$OnError implements OnError {
  const _$OnError(this.response);

  @override
  final RefereeResponse response;

  @override
  String toString() {
    return 'GameScreenEvent.onError(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnError &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      __$$OnErrorCopyWithImpl<_$OnError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RefereeResponse response) onError,
    required TResult Function(RefereeResponse response) onGameEnd,
  }) {
    return onError(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RefereeResponse response)? onError,
    TResult Function(RefereeResponse response)? onGameEnd,
  }) {
    return onError?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RefereeResponse response)? onError,
    TResult Function(RefereeResponse response)? onGameEnd,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnError value) onError,
    required TResult Function(OnGameEnd value) onGameEnd,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnError value)? onError,
    TResult Function(OnGameEnd value)? onGameEnd,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnError value)? onError,
    TResult Function(OnGameEnd value)? onGameEnd,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class OnError implements GameScreenEvent {
  const factory OnError(final RefereeResponse response) = _$OnError;

  @override
  RefereeResponse get response;
  @override
  @JsonKey(ignore: true)
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnGameEndCopyWith<$Res>
    implements $GameScreenEventCopyWith<$Res> {
  factory _$$OnGameEndCopyWith(
          _$OnGameEnd value, $Res Function(_$OnGameEnd) then) =
      __$$OnGameEndCopyWithImpl<$Res>;
  @override
  $Res call({RefereeResponse response});
}

/// @nodoc
class __$$OnGameEndCopyWithImpl<$Res>
    extends _$GameScreenEventCopyWithImpl<$Res>
    implements _$$OnGameEndCopyWith<$Res> {
  __$$OnGameEndCopyWithImpl(
      _$OnGameEnd _value, $Res Function(_$OnGameEnd) _then)
      : super(_value, (v) => _then(v as _$OnGameEnd));

  @override
  _$OnGameEnd get _value => super._value as _$OnGameEnd;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$OnGameEnd(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as RefereeResponse,
    ));
  }
}

/// @nodoc

class _$OnGameEnd implements OnGameEnd {
  const _$OnGameEnd(this.response);

  @override
  final RefereeResponse response;

  @override
  String toString() {
    return 'GameScreenEvent.onGameEnd(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnGameEnd &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$OnGameEndCopyWith<_$OnGameEnd> get copyWith =>
      __$$OnGameEndCopyWithImpl<_$OnGameEnd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RefereeResponse response) onError,
    required TResult Function(RefereeResponse response) onGameEnd,
  }) {
    return onGameEnd(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(RefereeResponse response)? onError,
    TResult Function(RefereeResponse response)? onGameEnd,
  }) {
    return onGameEnd?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RefereeResponse response)? onError,
    TResult Function(RefereeResponse response)? onGameEnd,
    required TResult orElse(),
  }) {
    if (onGameEnd != null) {
      return onGameEnd(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnError value) onError,
    required TResult Function(OnGameEnd value) onGameEnd,
  }) {
    return onGameEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnError value)? onError,
    TResult Function(OnGameEnd value)? onGameEnd,
  }) {
    return onGameEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnError value)? onError,
    TResult Function(OnGameEnd value)? onGameEnd,
    required TResult orElse(),
  }) {
    if (onGameEnd != null) {
      return onGameEnd(this);
    }
    return orElse();
  }
}

abstract class OnGameEnd implements GameScreenEvent {
  const factory OnGameEnd(final RefereeResponse response) = _$OnGameEnd;

  @override
  RefereeResponse get response;
  @override
  @JsonKey(ignore: true)
  _$$OnGameEndCopyWith<_$OnGameEnd> get copyWith =>
      throw _privateConstructorUsedError;
}
