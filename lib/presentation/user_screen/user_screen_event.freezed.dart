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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onEditPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onEditPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnEditPressed value) onEditPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
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
  }) {
    return onEditPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onEditPressed,
  }) {
    return onEditPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onEditPressed,
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
  }) {
    return onEditPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
  }) {
    return onEditPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnEditPressed value)? onEditPressed,
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
