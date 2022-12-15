// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditScreenEventCopyWith<$Res> {
  factory $EditScreenEventCopyWith(
          EditScreenEvent value, $Res Function(EditScreenEvent) then) =
      _$EditScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditScreenEventCopyWithImpl<$Res>
    implements $EditScreenEventCopyWith<$Res> {
  _$EditScreenEventCopyWithImpl(this._value, this._then);

  final EditScreenEvent _value;
  // ignore: unused_field
  final $Res Function(EditScreenEvent) _then;
}

/// @nodoc
abstract class _$$OnSaveCopyWith<$Res> {
  factory _$$OnSaveCopyWith(_$OnSave value, $Res Function(_$OnSave) then) =
      __$$OnSaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSaveCopyWithImpl<$Res> extends _$EditScreenEventCopyWithImpl<$Res>
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
    return 'EditScreenEvent.onSave()';
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
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) {
    return onSave();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) {
    return onSave?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) {
    return onSave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) {
    return onSave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class OnSave implements EditScreenEvent {
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
    extends _$EditScreenEventCopyWithImpl<$Res>
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
    return 'EditScreenEvent.onProfileTap()';
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
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) {
    return onProfileTap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) {
    return onProfileTap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) {
    return onProfileTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) {
    return onProfileTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class OnProfileTap implements EditScreenEvent {
  const factory OnProfileTap() = _$OnProfileTap;
}

/// @nodoc
abstract class _$$OnErrorCopyWith<$Res> {
  factory _$$OnErrorCopyWith(_$OnError value, $Res Function(_$OnError) then) =
      __$$OnErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$OnErrorCopyWithImpl<$Res> extends _$EditScreenEventCopyWithImpl<$Res>
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
    return 'EditScreenEvent.onError(message: $message)';
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
    required TResult Function() onSave,
    required TResult Function() onProfileTap,
    required TResult Function(String message) onError,
  }) {
    return onError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onSave,
    TResult Function()? onProfileTap,
    TResult Function(String message)? onError,
  }) {
    return onError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(OnSave value) onSave,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnError value) onError,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnSave value)? onSave,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnError value)? onError,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class OnError implements EditScreenEvent {
  const factory OnError(final String message) = _$OnError;

  String get message;
  @JsonKey(ignore: true)
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      throw _privateConstructorUsedError;
}
