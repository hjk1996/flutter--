// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryState _$HistoryStateFromJson(Map<String, dynamic> json) {
  return _HistoryState.fromJson(json);
}

/// @nodoc
mixin _$HistoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<GameLog> get gameLogs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<GameLog> gameLogs});
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  final HistoryState _value;
  // ignore: unused_field
  final $Res Function(HistoryState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? gameLogs = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      gameLogs: gameLogs == freezed
          ? _value.gameLogs
          : gameLogs // ignore: cast_nullable_to_non_nullable
              as List<GameLog>,
    ));
  }
}

/// @nodoc
abstract class _$$_HistoryStateCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$_HistoryStateCopyWith(
          _$_HistoryState value, $Res Function(_$_HistoryState) then) =
      __$$_HistoryStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<GameLog> gameLogs});
}

/// @nodoc
class __$$_HistoryStateCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements _$$_HistoryStateCopyWith<$Res> {
  __$$_HistoryStateCopyWithImpl(
      _$_HistoryState _value, $Res Function(_$_HistoryState) _then)
      : super(_value, (v) => _then(v as _$_HistoryState));

  @override
  _$_HistoryState get _value => super._value as _$_HistoryState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? gameLogs = freezed,
  }) {
    return _then(_$_HistoryState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      gameLogs: gameLogs == freezed
          ? _value._gameLogs
          : gameLogs // ignore: cast_nullable_to_non_nullable
              as List<GameLog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryState implements _HistoryState {
  _$_HistoryState(
      {required this.isLoading, required final List<GameLog> gameLogs})
      : _gameLogs = gameLogs;

  factory _$_HistoryState.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryStateFromJson(json);

  @override
  final bool isLoading;
  final List<GameLog> _gameLogs;
  @override
  List<GameLog> get gameLogs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameLogs);
  }

  @override
  String toString() {
    return 'HistoryState(isLoading: $isLoading, gameLogs: $gameLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other._gameLogs, _gameLogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_gameLogs));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryStateCopyWith<_$_HistoryState> get copyWith =>
      __$$_HistoryStateCopyWithImpl<_$_HistoryState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryStateToJson(
      this,
    );
  }
}

abstract class _HistoryState implements HistoryState {
  factory _HistoryState(
      {required final bool isLoading,
      required final List<GameLog> gameLogs}) = _$_HistoryState;

  factory _HistoryState.fromJson(Map<String, dynamic> json) =
      _$_HistoryState.fromJson;

  @override
  bool get isLoading;
  @override
  List<GameLog> get gameLogs;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryStateCopyWith<_$_HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
