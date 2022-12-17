// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feedback_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedbackScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onSuccess,
    required TResult Function(String message) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSuccess,
    TResult Function(String message)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onSuccess,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSuccess value) onSuccess,
    required TResult Function(OnError value) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackScreenEventCopyWith<$Res> {
  factory $FeedbackScreenEventCopyWith(
          FeedbackScreenEvent value, $Res Function(FeedbackScreenEvent) then) =
      _$FeedbackScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FeedbackScreenEventCopyWithImpl<$Res>
    implements $FeedbackScreenEventCopyWith<$Res> {
  _$FeedbackScreenEventCopyWithImpl(this._value, this._then);

  final FeedbackScreenEvent _value;
  // ignore: unused_field
  final $Res Function(FeedbackScreenEvent) _then;
}

/// @nodoc
abstract class _$$OnSuccessCopyWith<$Res> {
  factory _$$OnSuccessCopyWith(
          _$OnSuccess value, $Res Function(_$OnSuccess) then) =
      __$$OnSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSuccessCopyWithImpl<$Res>
    extends _$FeedbackScreenEventCopyWithImpl<$Res>
    implements _$$OnSuccessCopyWith<$Res> {
  __$$OnSuccessCopyWithImpl(
      _$OnSuccess _value, $Res Function(_$OnSuccess) _then)
      : super(_value, (v) => _then(v as _$OnSuccess));

  @override
  _$OnSuccess get _value => super._value as _$OnSuccess;
}

/// @nodoc

class _$OnSuccess implements OnSuccess {
  const _$OnSuccess();

  @override
  String toString() {
    return 'FeedbackScreenEvent.onSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onSuccess,
    required TResult Function(String message) onError,
  }) {
    return onSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSuccess,
    TResult Function(String message)? onError,
  }) {
    return onSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onSuccess,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSuccess value) onSuccess,
    required TResult Function(OnError value) onError,
  }) {
    return onSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
  }) {
    return onSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(this);
    }
    return orElse();
  }
}

abstract class OnSuccess implements FeedbackScreenEvent {
  const factory OnSuccess() = _$OnSuccess;
}

/// @nodoc
abstract class _$$OnErrorCopyWith<$Res> {
  factory _$$OnErrorCopyWith(_$OnError value, $Res Function(_$OnError) then) =
      __$$OnErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$OnErrorCopyWithImpl<$Res>
    extends _$FeedbackScreenEventCopyWithImpl<$Res>
    implements _$$OnErrorCopyWith<$Res> {
  __$$OnErrorCopyWithImpl(_$OnError _value, $Res Function(_$OnError) _then)
      : super(_value, (v) => _then(v as _$OnError));

  @override
  _$OnError get _value => super._value as _$OnError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$OnError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnError implements OnError {
  const _$OnError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FeedbackScreenEvent.onError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      __$$OnErrorCopyWithImpl<_$OnError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onSuccess,
    required TResult Function(String message) onError,
  }) {
    return onError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSuccess,
    TResult Function(String message)? onError,
  }) {
    return onError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onSuccess,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSuccess value) onSuccess,
    required TResult Function(OnError value) onError,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSuccess value)? onSuccess,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class OnError implements FeedbackScreenEvent {
  const factory OnError(final String message) = _$OnError;

  String get message;
  @JsonKey(ignore: true)
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      throw _privateConstructorUsedError;
}
