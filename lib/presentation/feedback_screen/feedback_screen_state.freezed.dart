// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feedback_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedbackScreenState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedbackScreenStateCopyWith<FeedbackScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackScreenStateCopyWith<$Res> {
  factory $FeedbackScreenStateCopyWith(
          FeedbackScreenState value, $Res Function(FeedbackScreenState) then) =
      _$FeedbackScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class _$FeedbackScreenStateCopyWithImpl<$Res>
    implements $FeedbackScreenStateCopyWith<$Res> {
  _$FeedbackScreenStateCopyWithImpl(this._value, this._then);

  final FeedbackScreenState _value;
  // ignore: unused_field
  final $Res Function(FeedbackScreenState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FeedbackScreenStateCopyWith<$Res>
    implements $FeedbackScreenStateCopyWith<$Res> {
  factory _$$_FeedbackScreenStateCopyWith(_$_FeedbackScreenState value,
          $Res Function(_$_FeedbackScreenState) then) =
      __$$_FeedbackScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_FeedbackScreenStateCopyWithImpl<$Res>
    extends _$FeedbackScreenStateCopyWithImpl<$Res>
    implements _$$_FeedbackScreenStateCopyWith<$Res> {
  __$$_FeedbackScreenStateCopyWithImpl(_$_FeedbackScreenState _value,
      $Res Function(_$_FeedbackScreenState) _then)
      : super(_value, (v) => _then(v as _$_FeedbackScreenState));

  @override
  _$_FeedbackScreenState get _value => super._value as _$_FeedbackScreenState;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$_FeedbackScreenState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FeedbackScreenState implements _FeedbackScreenState {
  _$_FeedbackScreenState({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'FeedbackScreenState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedbackScreenState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_FeedbackScreenStateCopyWith<_$_FeedbackScreenState> get copyWith =>
      __$$_FeedbackScreenStateCopyWithImpl<_$_FeedbackScreenState>(
          this, _$identity);
}

abstract class _FeedbackScreenState implements FeedbackScreenState {
  factory _FeedbackScreenState({required final bool isLoading}) =
      _$_FeedbackScreenState;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_FeedbackScreenStateCopyWith<_$_FeedbackScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
