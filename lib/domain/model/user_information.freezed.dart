// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) {
  return _UserInformation.fromJson(json);
}

/// @nodoc
mixin _$UserInformation {
  String get name => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  int get gameCount => throw _privateConstructorUsedError;
  int get easyWinCount => throw _privateConstructorUsedError;
  int get normalWinCount => throw _privateConstructorUsedError;
  int get hardWinCount => throw _privateConstructorUsedError;
  int get impossibleWinCount => throw _privateConstructorUsedError;
  DateTime? get lastGameAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInformationCopyWith<UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationCopyWith<$Res> {
  factory $UserInformationCopyWith(
          UserInformation value, $Res Function(UserInformation) then) =
      _$UserInformationCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? photoUrl,
      int gameCount,
      int easyWinCount,
      int normalWinCount,
      int hardWinCount,
      int impossibleWinCount,
      DateTime? lastGameAt});
}

/// @nodoc
class _$UserInformationCopyWithImpl<$Res>
    implements $UserInformationCopyWith<$Res> {
  _$UserInformationCopyWithImpl(this._value, this._then);

  final UserInformation _value;
  // ignore: unused_field
  final $Res Function(UserInformation) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? gameCount = freezed,
    Object? easyWinCount = freezed,
    Object? normalWinCount = freezed,
    Object? hardWinCount = freezed,
    Object? impossibleWinCount = freezed,
    Object? lastGameAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserInformationCopyWith<$Res>
    implements $UserInformationCopyWith<$Res> {
  factory _$$_UserInformationCopyWith(
          _$_UserInformation value, $Res Function(_$_UserInformation) then) =
      __$$_UserInformationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? photoUrl,
      int gameCount,
      int easyWinCount,
      int normalWinCount,
      int hardWinCount,
      int impossibleWinCount,
      DateTime? lastGameAt});
}

/// @nodoc
class __$$_UserInformationCopyWithImpl<$Res>
    extends _$UserInformationCopyWithImpl<$Res>
    implements _$$_UserInformationCopyWith<$Res> {
  __$$_UserInformationCopyWithImpl(
      _$_UserInformation _value, $Res Function(_$_UserInformation) _then)
      : super(_value, (v) => _then(v as _$_UserInformation));

  @override
  _$_UserInformation get _value => super._value as _$_UserInformation;

  @override
  $Res call({
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? gameCount = freezed,
    Object? easyWinCount = freezed,
    Object? normalWinCount = freezed,
    Object? hardWinCount = freezed,
    Object? impossibleWinCount = freezed,
    Object? lastGameAt = freezed,
  }) {
    return _then(_$_UserInformation(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInformation implements _UserInformation {
  _$_UserInformation(
      {required this.name,
      required this.photoUrl,
      required this.gameCount,
      required this.easyWinCount,
      required this.normalWinCount,
      required this.hardWinCount,
      required this.impossibleWinCount,
      required this.lastGameAt});

  factory _$_UserInformation.fromJson(Map<String, dynamic> json) =>
      _$$_UserInformationFromJson(json);

  @override
  final String name;
  @override
  final String? photoUrl;
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
  final DateTime? lastGameAt;

  @override
  String toString() {
    return 'UserInformation(name: $name, photoUrl: $photoUrl, gameCount: $gameCount, easyWinCount: $easyWinCount, normalWinCount: $normalWinCount, hardWinCount: $hardWinCount, impossibleWinCount: $impossibleWinCount, lastGameAt: $lastGameAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInformation &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
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
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(gameCount),
      const DeepCollectionEquality().hash(easyWinCount),
      const DeepCollectionEquality().hash(normalWinCount),
      const DeepCollectionEquality().hash(hardWinCount),
      const DeepCollectionEquality().hash(impossibleWinCount),
      const DeepCollectionEquality().hash(lastGameAt));

  @JsonKey(ignore: true)
  @override
  _$$_UserInformationCopyWith<_$_UserInformation> get copyWith =>
      __$$_UserInformationCopyWithImpl<_$_UserInformation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInformationToJson(
      this,
    );
  }
}

abstract class _UserInformation implements UserInformation {
  factory _UserInformation(
      {required final String name,
      required final String? photoUrl,
      required final int gameCount,
      required final int easyWinCount,
      required final int normalWinCount,
      required final int hardWinCount,
      required final int impossibleWinCount,
      required final DateTime? lastGameAt}) = _$_UserInformation;

  factory _UserInformation.fromJson(Map<String, dynamic> json) =
      _$_UserInformation.fromJson;

  @override
  String get name;
  @override
  String? get photoUrl;
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
  DateTime? get lastGameAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserInformationCopyWith<_$_UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
