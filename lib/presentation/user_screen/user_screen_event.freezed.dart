// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onEditPressed,
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditPressed value) onEditPressed,
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScreenEventCopyWith<$Res> {
  factory $UserScreenEventCopyWith(
          UserScreenEvent value, $Res Function(UserScreenEvent) then) =
      _$UserScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserScreenEventCopyWithImpl<$Res>
    implements $UserScreenEventCopyWith<$Res> {
  _$UserScreenEventCopyWithImpl(this._value, this._then);

  final UserScreenEvent _value;
  // ignore: unused_field
  final $Res Function(UserScreenEvent) _then;
}

/// @nodoc
abstract class _$$OnEditPressedCopyWith<$Res> {
  factory _$$OnEditPressedCopyWith(
          _$OnEditPressed value, $Res Function(_$OnEditPressed) then) =
      __$$OnEditPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnEditPressedCopyWithImpl<$Res>
    extends _$UserScreenEventCopyWithImpl<$Res>
    implements _$$OnEditPressedCopyWith<$Res> {
  __$$OnEditPressedCopyWithImpl(
      _$OnEditPressed _value, $Res Function(_$OnEditPressed) _then)
      : super(_value, (v) => _then(v as _$OnEditPressed));

  @override
  _$OnEditPressed get _value => super._value as _$OnEditPressed;
}

/// @nodoc

class _$OnEditPressed implements OnEditPressed {
  const _$OnEditPressed();

  @override
  String toString() {
    return 'UserScreenEvent.onEditPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnEditPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onEditPressed,
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) {
    return onEditPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) {
    return onEditPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) {
    if (onEditPressed != null) {
      return onEditPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditPressed value) onEditPressed,
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) {
    return onEditPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) {
    return onEditPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onEditPressed != null) {
      return onEditPressed(this);
    }
    return orElse();
  }
}

abstract class OnEditPressed implements UserScreenEvent {
  const factory OnEditPressed() = _$OnEditPressed;
}

/// @nodoc
abstract class _$$OnSaveCopyWith<$Res> {
  factory _$$OnSaveCopyWith(_$OnSave value, $Res Function(_$OnSave) then) =
      __$$OnSaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSaveCopyWithImpl<$Res> extends _$UserScreenEventCopyWithImpl<$Res>
    implements _$$OnSaveCopyWith<$Res> {
  __$$OnSaveCopyWithImpl(_$OnSave _value, $Res Function(_$OnSave) _then)
      : super(_value, (v) => _then(v as _$OnSave));

  @override
  _$OnSave get _value => super._value as _$OnSave;
}

/// @nodoc

class _$OnSave implements OnSave {
  const _$OnSave();

  @override
  String toString() {
    return 'UserScreenEvent.onSave()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSave);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onEditPressed,
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) {
    return onSave();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) {
    return onSave?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) {
    if (onSave != null) {
      return onSave();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditPressed value) onEditPressed,
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) {
    return onSave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) {
    return onSave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onSave != null) {
      return onSave(this);
    }
    return orElse();
  }
}

abstract class OnSave implements UserScreenEvent {
  const factory OnSave() = _$OnSave;
}

/// @nodoc
abstract class _$$OnProfileTapCopyWith<$Res> {
  factory _$$OnProfileTapCopyWith(
          _$OnProfileTap value, $Res Function(_$OnProfileTap) then) =
      __$$OnProfileTapCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnProfileTapCopyWithImpl<$Res>
    extends _$UserScreenEventCopyWithImpl<$Res>
    implements _$$OnProfileTapCopyWith<$Res> {
  __$$OnProfileTapCopyWithImpl(
      _$OnProfileTap _value, $Res Function(_$OnProfileTap) _then)
      : super(_value, (v) => _then(v as _$OnProfileTap));

  @override
  _$OnProfileTap get _value => super._value as _$OnProfileTap;
}

/// @nodoc

class _$OnProfileTap implements OnProfileTap {
  const _$OnProfileTap();

  @override
  String toString() {
    return 'UserScreenEvent.onProfileTap()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnProfileTap);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onEditPressed,
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) {
    return onProfileTap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) {
    return onProfileTap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) {
    if (onProfileTap != null) {
      return onProfileTap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditPressed value) onEditPressed,
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) {
    return onProfileTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) {
    return onProfileTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onProfileTap != null) {
      return onProfileTap(this);
    }
    return orElse();
  }
}

abstract class OnProfileTap implements UserScreenEvent {
  const factory OnProfileTap() = _$OnProfileTap;
}

/// @nodoc
abstract class _$$OnErrorCopyWith<$Res> {
  factory _$$OnErrorCopyWith(_$OnError value, $Res Function(_$OnError) then) =
      __$$OnErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$OnErrorCopyWithImpl<$Res> extends _$UserScreenEventCopyWithImpl<$Res>
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
    return 'UserScreenEvent.onError(message: $message)';
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
    required TResult Function() onEditPressed,
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) {
    return onError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) {
    return onError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onEditPressed,
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
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
    required TResult Function(OnEditPressed value) onEditPressed,
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class OnError implements UserScreenEvent {
  const factory OnError(final String message) = _$OnError;

  String get message;
  @JsonKey(ignore: true)
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      throw _privateConstructorUsedError;
}
