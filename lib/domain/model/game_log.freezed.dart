// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameLog _$GameLogFromJson(Map<String, dynamic> json) {
  return _GameLog.fromJson(json);
}

/// @nodoc
mixin _$GameLog {
  String get id => throw _privateConstructorUsedError;
  GameDifficulty get difficulty => throw _privateConstructorUsedError;
  DateTime get endAt => throw _privateConstructorUsedError;
  bool get win => throw _privateConstructorUsedError;
  List<Message> get log => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameLogCopyWith<GameLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameLogCopyWith<$Res> {
  factory $GameLogCopyWith(GameLog value, $Res Function(GameLog) then) =
      _$GameLogCopyWithImpl<$Res>;
  $Res call(
      {String id,
      GameDifficulty difficulty,
      DateTime endAt,
      bool win,
      List<Message> log});
}

/// @nodoc
class _$GameLogCopyWithImpl<$Res> implements $GameLogCopyWith<$Res> {
  _$GameLogCopyWithImpl(this._value, this._then);

  final GameLog _value;
  // ignore: unused_field
  final $Res Function(GameLog) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? difficulty = freezed,
    Object? endAt = freezed,
    Object? win = freezed,
    Object? log = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as GameDifficulty,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
      log: log == freezed
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$$_GameLogCopyWith<$Res> implements $GameLogCopyWith<$Res> {
  factory _$$_GameLogCopyWith(
          _$_GameLog value, $Res Function(_$_GameLog) then) =
      __$$_GameLogCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      GameDifficulty difficulty,
      DateTime endAt,
      bool win,
      List<Message> log});
}

/// @nodoc
class __$$_GameLogCopyWithImpl<$Res> extends _$GameLogCopyWithImpl<$Res>
    implements _$$_GameLogCopyWith<$Res> {
  __$$_GameLogCopyWithImpl(_$_GameLog _value, $Res Function(_$_GameLog) _then)
      : super(_value, (v) => _then(v as _$_GameLog));

  @override
  _$_GameLog get _value => super._value as _$_GameLog;

  @override
  $Res call({
    Object? id = freezed,
    Object? difficulty = freezed,
    Object? endAt = freezed,
    Object? win = freezed,
    Object? log = freezed,
  }) {
    return _then(_$_GameLog(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as GameDifficulty,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
      log: log == freezed
          ? _value._log
          : log // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_GameLog implements _GameLog {
  _$_GameLog(
      {required this.id,
      required this.difficulty,
      required this.endAt,
      required this.win,
      required final List<Message> log})
      : _log = log;

  factory _$_GameLog.fromJson(Map<String, dynamic> json) =>
      _$$_GameLogFromJson(json);

  @override
  final String id;
  @override
  final GameDifficulty difficulty;
  @override
  final DateTime endAt;
  @override
  final bool win;
  final List<Message> _log;
  @override
  List<Message> get log {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_log);
  }

  @override
  String toString() {
    return 'GameLog(id: $id, difficulty: $difficulty, endAt: $endAt, win: $win, log: $log)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameLog &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.difficulty, difficulty) &&
            const DeepCollectionEquality().equals(other.endAt, endAt) &&
            const DeepCollectionEquality().equals(other.win, win) &&
            const DeepCollectionEquality().equals(other._log, _log));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(difficulty),
      const DeepCollectionEquality().hash(endAt),
      const DeepCollectionEquality().hash(win),
      const DeepCollectionEquality().hash(_log));

  @JsonKey(ignore: true)
  @override
  _$$_GameLogCopyWith<_$_GameLog> get copyWith =>
      __$$_GameLogCopyWithImpl<_$_GameLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameLogToJson(
      this,
    );
  }
}

abstract class _GameLog implements GameLog {
  factory _GameLog(
      {required final String id,
      required final GameDifficulty difficulty,
      required final DateTime endAt,
      required final bool win,
      required final List<Message> log}) = _$_GameLog;

  factory _GameLog.fromJson(Map<String, dynamic> json) = _$_GameLog.fromJson;

  @override
  String get id;
  @override
  GameDifficulty get difficulty;
  @override
  DateTime get endAt;
  @override
  bool get win;
  @override
  List<Message> get log;
  @override
  @JsonKey(ignore: true)
  _$$_GameLogCopyWith<_$_GameLog> get copyWith =>
      throw _privateConstructorUsedError;
}
