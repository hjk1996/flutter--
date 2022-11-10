// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGameStart,
    required TResult Function() onLogoutPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onGameStart,
    TResult Function()? onLogoutPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGameStart,
    TResult Function()? onLogoutPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGameStart value) onGameStart,
    required TResult Function(OnLogoutPressed value) onLogoutPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnGameStart value)? onGameStart,
    TResult Function(OnLogoutPressed value)? onLogoutPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGameStart value)? onGameStart,
    TResult Function(OnLogoutPressed value)? onLogoutPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenEventCopyWith<$Res> {
  factory $HomeScreenEventCopyWith(
          HomeScreenEvent value, $Res Function(HomeScreenEvent) then) =
      _$HomeScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeScreenEventCopyWithImpl<$Res>
    implements $HomeScreenEventCopyWith<$Res> {
  _$HomeScreenEventCopyWithImpl(this._value, this._then);

  final HomeScreenEvent _value;
  // ignore: unused_field
  final $Res Function(HomeScreenEvent) _then;
}

/// @nodoc
abstract class _$$OnGameStartCopyWith<$Res> {
  factory _$$OnGameStartCopyWith(
          _$OnGameStart value, $Res Function(_$OnGameStart) then) =
      __$$OnGameStartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnGameStartCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res>
    implements _$$OnGameStartCopyWith<$Res> {
  __$$OnGameStartCopyWithImpl(
      _$OnGameStart _value, $Res Function(_$OnGameStart) _then)
      : super(_value, (v) => _then(v as _$OnGameStart));

  @override
  _$OnGameStart get _value => super._value as _$OnGameStart;
}

/// @nodoc

class _$OnGameStart with DiagnosticableTreeMixin implements OnGameStart {
  const _$OnGameStart();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeScreenEvent.onGameStart()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeScreenEvent.onGameStart'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnGameStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGameStart,
    required TResult Function() onLogoutPressed,
  }) {
    return onGameStart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onGameStart,
    TResult Function()? onLogoutPressed,
  }) {
    return onGameStart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGameStart,
    TResult Function()? onLogoutPressed,
    required TResult orElse(),
  }) {
    if (onGameStart != null) {
      return onGameStart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGameStart value) onGameStart,
    required TResult Function(OnLogoutPressed value) onLogoutPressed,
  }) {
    return onGameStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnGameStart value)? onGameStart,
    TResult Function(OnLogoutPressed value)? onLogoutPressed,
  }) {
    return onGameStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGameStart value)? onGameStart,
    TResult Function(OnLogoutPressed value)? onLogoutPressed,
    required TResult orElse(),
  }) {
    if (onGameStart != null) {
      return onGameStart(this);
    }
    return orElse();
  }
}

abstract class OnGameStart implements HomeScreenEvent {
  const factory OnGameStart() = _$OnGameStart;
}

/// @nodoc
abstract class _$$OnLogoutPressedCopyWith<$Res> {
  factory _$$OnLogoutPressedCopyWith(
          _$OnLogoutPressed value, $Res Function(_$OnLogoutPressed) then) =
      __$$OnLogoutPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLogoutPressedCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res>
    implements _$$OnLogoutPressedCopyWith<$Res> {
  __$$OnLogoutPressedCopyWithImpl(
      _$OnLogoutPressed _value, $Res Function(_$OnLogoutPressed) _then)
      : super(_value, (v) => _then(v as _$OnLogoutPressed));

  @override
  _$OnLogoutPressed get _value => super._value as _$OnLogoutPressed;
}

/// @nodoc

class _$OnLogoutPressed
    with DiagnosticableTreeMixin
    implements OnLogoutPressed {
  const _$OnLogoutPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeScreenEvent.onLogoutPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'HomeScreenEvent.onLogoutPressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLogoutPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGameStart,
    required TResult Function() onLogoutPressed,
  }) {
    return onLogoutPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onGameStart,
    TResult Function()? onLogoutPressed,
  }) {
    return onLogoutPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGameStart,
    TResult Function()? onLogoutPressed,
    required TResult orElse(),
  }) {
    if (onLogoutPressed != null) {
      return onLogoutPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGameStart value) onGameStart,
    required TResult Function(OnLogoutPressed value) onLogoutPressed,
  }) {
    return onLogoutPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnGameStart value)? onGameStart,
    TResult Function(OnLogoutPressed value)? onLogoutPressed,
  }) {
    return onLogoutPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGameStart value)? onGameStart,
    TResult Function(OnLogoutPressed value)? onLogoutPressed,
    required TResult orElse(),
  }) {
    if (onLogoutPressed != null) {
      return onLogoutPressed(this);
    }
    return orElse();
  }
}

abstract class OnLogoutPressed implements HomeScreenEvent {
  const factory OnLogoutPressed() = _$OnLogoutPressed;
}
