// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserStat _$UserStatFromJson(Map<String, dynamic> json) {
  return _UserStat.fromJson(json);
}

/// @nodoc
mixin _$UserStat {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get gameCount => throw _privateConstructorUsedError;
  int get easyWinCount => throw _privateConstructorUsedError;
  int get normalWinCount => throw _privateConstructorUsedError;
  int get hardWinCount => throw _privateConstructorUsedError;
  int get impossibleWinCount => throw _privateConstructorUsedError;
  DateTime get lastGameAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatCopyWith<UserStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatCopyWith<$Res> {
  factory $UserStatCopyWith(UserStat value, $Res Function(UserStat) then) =
      _$UserStatCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      int gameCount,
      int easyWinCount,
      int normalWinCount,
      int hardWinCount,
      int impossibleWinCount,
      DateTime lastGameAt});
}

/// @nodoc
class _$UserStatCopyWithImpl<$Res> implements $UserStatCopyWith<$Res> {
  _$UserStatCopyWithImpl(this._value, this._then);

  final UserStat _value;
  // ignore: unused_field
  final $Res Function(UserStat) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? gameCount = freezed,
    Object? easyWinCount = freezed,
    Object? normalWinCount = freezed,
    Object? hardWinCount = freezed,
    Object? impossibleWinCount = freezed,
    Object? lastGameAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gameCount: gameCount == freezed
          ? _value.gameCount
          : gameCount // ignore: cast_nullable_to_non_nullable
              as int,
      easyWinCount: easyWinCount == freezed
          ? _value.easyWinCount
          : easyWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      normalWinCount: normalWinCount == freezed
          ? _value.normalWinCount
          : normalWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      hardWinCount: hardWinCount == freezed
          ? _value.hardWinCount
          : hardWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      impossibleWinCount: impossibleWinCount == freezed
          ? _value.impossibleWinCount
          : impossibleWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastGameAt: lastGameAt == freezed
          ? _value.lastGameAt
          : lastGameAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_UserStatCopyWith<$Res> implements $UserStatCopyWith<$Res> {
  factory _$$_UserStatCopyWith(
          _$_UserStat value, $Res Function(_$_UserStat) then) =
      __$$_UserStatCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      int gameCount,
      int easyWinCount,
      int normalWinCount,
      int hardWinCount,
      int impossibleWinCount,
      DateTime lastGameAt});
}

/// @nodoc
class __$$_UserStatCopyWithImpl<$Res> extends _$UserStatCopyWithImpl<$Res>
    implements _$$_UserStatCopyWith<$Res> {
  __$$_UserStatCopyWithImpl(
      _$_UserStat _value, $Res Function(_$_UserStat) _then)
      : super(_value, (v) => _then(v as _$_UserStat));

  @override
  _$_UserStat get _value => super._value as _$_UserStat;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? gameCount = freezed,
    Object? easyWinCount = freezed,
    Object? normalWinCount = freezed,
    Object? hardWinCount = freezed,
    Object? impossibleWinCount = freezed,
    Object? lastGameAt = freezed,
  }) {
    return _then(_$_UserStat(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gameCount: gameCount == freezed
          ? _value.gameCount
          : gameCount // ignore: cast_nullable_to_non_nullable
              as int,
      easyWinCount: easyWinCount == freezed
          ? _value.easyWinCount
          : easyWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      normalWinCount: normalWinCount == freezed
          ? _value.normalWinCount
          : normalWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      hardWinCount: hardWinCount == freezed
          ? _value.hardWinCount
          : hardWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      impossibleWinCount: impossibleWinCount == freezed
          ? _value.impossibleWinCount
          : impossibleWinCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastGameAt: lastGameAt == freezed
          ? _value.lastGameAt
          : lastGameAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserStat implements _UserStat {
  _$_UserStat(
      {required this.uid,
      required this.name,
      required this.gameCount,
      required this.easyWinCount,
      required this.normalWinCount,
      required this.hardWinCount,
      required this.impossibleWinCount,
      required this.lastGameAt});

  factory _$_UserStat.fromJson(Map<String, dynamic> json) =>
      _$$_UserStatFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final int gameCount;
  @override
  final int easyWinCount;
  @override
  final int normalWinCount;
  @override
  final int hardWinCount;
  @override
  final int impossibleWinCount;
  @override
  final DateTime lastGameAt;

  @override
  String toString() {
    return 'UserStat(uid: $uid, name: $name, gameCount: $gameCount, easyWinCount: $easyWinCount, normalWinCount: $normalWinCount, hardWinCount: $hardWinCount, impossibleWinCount: $impossibleWinCount, lastGameAt: $lastGameAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserStat &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gameCount, gameCount) &&
            const DeepCollectionEquality()
                .equals(other.easyWinCount, easyWinCount) &&
            const DeepCollectionEquality()
                .equals(other.normalWinCount, normalWinCount) &&
            const DeepCollectionEquality()
                .equals(other.hardWinCount, hardWinCount) &&
            const DeepCollectionEquality()
                .equals(other.impossibleWinCount, impossibleWinCount) &&
            const DeepCollectionEquality()
                .equals(other.lastGameAt, lastGameAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gameCount),
      const DeepCollectionEquality().hash(easyWinCount),
      const DeepCollectionEquality().hash(normalWinCount),
      const DeepCollectionEquality().hash(hardWinCount),
      const DeepCollectionEquality().hash(impossibleWinCount),
      const DeepCollectionEquality().hash(lastGameAt));

  @JsonKey(ignore: true)
  @override
  _$$_UserStatCopyWith<_$_UserStat> get copyWith =>
      __$$_UserStatCopyWithImpl<_$_UserStat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStatToJson(
      this,
    );
  }
}

abstract class _UserStat implements UserStat {
  factory _UserStat(
      {required final String uid,
      required final String name,
      required final int gameCount,
      required final int easyWinCount,
      required final int normalWinCount,
      required final int hardWinCount,
      required final int impossibleWinCount,
      required final DateTime lastGameAt}) = _$_UserStat;

  factory _UserStat.fromJson(Map<String, dynamic> json) = _$_UserStat.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  int get gameCount;
  @override
  int get easyWinCount;
  @override
  int get normalWinCount;
  @override
  int get hardWinCount;
  @override
  int get impossibleWinCount;
  @override
  DateTime get lastGameAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserStatCopyWith<_$_UserStat> get copyWith =>
      throw _privateConstructorUsedError;
}
