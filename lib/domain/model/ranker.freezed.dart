// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ranker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Ranker {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  Image? get photo => throw _privateConstructorUsedError;
  int get wins => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RankerCopyWith<Ranker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankerCopyWith<$Res> {
  factory $RankerCopyWith(Ranker value, $Res Function(Ranker) then) =
      _$RankerCopyWithImpl<$Res>;
  $Res call({String uid, String name, int rank, Image? photo, int wins});
}

/// @nodoc
class _$RankerCopyWithImpl<$Res> implements $RankerCopyWith<$Res> {
  _$RankerCopyWithImpl(this._value, this._then);

  final Ranker _value;
  // ignore: unused_field
  final $Res Function(Ranker) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? rank = freezed,
    Object? photo = freezed,
    Object? wins = freezed,
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
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Image?,
      wins: wins == freezed
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RankerCopyWith<$Res> implements $RankerCopyWith<$Res> {
  factory _$$_RankerCopyWith(_$_Ranker value, $Res Function(_$_Ranker) then) =
      __$$_RankerCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String name, int rank, Image? photo, int wins});
}

/// @nodoc
class __$$_RankerCopyWithImpl<$Res> extends _$RankerCopyWithImpl<$Res>
    implements _$$_RankerCopyWith<$Res> {
  __$$_RankerCopyWithImpl(_$_Ranker _value, $Res Function(_$_Ranker) _then)
      : super(_value, (v) => _then(v as _$_Ranker));

  @override
  _$_Ranker get _value => super._value as _$_Ranker;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? rank = freezed,
    Object? photo = freezed,
    Object? wins = freezed,
  }) {
    return _then(_$_Ranker(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Image?,
      wins: wins == freezed
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Ranker implements _Ranker {
  _$_Ranker(
      {required this.uid,
      required this.name,
      required this.rank,
      required this.photo,
      required this.wins});

  @override
  final String uid;
  @override
  final String name;
  @override
  final int rank;
  @override
  final Image? photo;
  @override
  final int wins;

  @override
  String toString() {
    return 'Ranker(uid: $uid, name: $name, rank: $rank, photo: $photo, wins: $wins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ranker &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.rank, rank) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality().equals(other.wins, wins));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(rank),
      const DeepCollectionEquality().hash(photo),
      const DeepCollectionEquality().hash(wins));

  @JsonKey(ignore: true)
  @override
  _$$_RankerCopyWith<_$_Ranker> get copyWith =>
      __$$_RankerCopyWithImpl<_$_Ranker>(this, _$identity);
}

abstract class _Ranker implements Ranker {
  factory _Ranker(
      {required final String uid,
      required final String name,
      required final int rank,
      required final Image? photo,
      required final int wins}) = _$_Ranker;

  @override
  String get uid;
  @override
  String get name;
  @override
  int get rank;
  @override
  Image? get photo;
  @override
  int get wins;
  @override
  @JsonKey(ignore: true)
  _$$_RankerCopyWith<_$_Ranker> get copyWith =>
      throw _privateConstructorUsedError;
}
