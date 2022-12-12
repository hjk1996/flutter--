// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserScreenState {
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserScreenStateCopyWith<UserScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScreenStateCopyWith<$Res> {
  factory $UserScreenStateCopyWith(
          UserScreenState value, $Res Function(UserScreenState) then) =
      _$UserScreenStateCopyWithImpl<$Res>;
  $Res call({User? user});
}

/// @nodoc
class _$UserScreenStateCopyWithImpl<$Res>
    implements $UserScreenStateCopyWith<$Res> {
  _$UserScreenStateCopyWithImpl(this._value, this._then);

  final UserScreenState _value;
  // ignore: unused_field
  final $Res Function(UserScreenState) _then;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserScreenStateCopyWith<$Res>
    implements $UserScreenStateCopyWith<$Res> {
  factory _$$_UserScreenStateCopyWith(
          _$_UserScreenState value, $Res Function(_$_UserScreenState) then) =
      __$$_UserScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({User? user});
}

/// @nodoc
class __$$_UserScreenStateCopyWithImpl<$Res>
    extends _$UserScreenStateCopyWithImpl<$Res>
    implements _$$_UserScreenStateCopyWith<$Res> {
  __$$_UserScreenStateCopyWithImpl(
      _$_UserScreenState _value, $Res Function(_$_UserScreenState) _then)
      : super(_value, (v) => _then(v as _$_UserScreenState));

  @override
  _$_UserScreenState get _value => super._value as _$_UserScreenState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_UserScreenState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_UserScreenState implements _UserScreenState {
  _$_UserScreenState({required this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'UserScreenState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserScreenState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_UserScreenStateCopyWith<_$_UserScreenState> get copyWith =>
      __$$_UserScreenStateCopyWithImpl<_$_UserScreenState>(this, _$identity);
}

abstract class _UserScreenState implements UserScreenState {
  factory _UserScreenState({required final User? user}) = _$_UserScreenState;

  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_UserScreenStateCopyWith<_$_UserScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
