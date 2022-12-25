// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rank_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RankBoard {
  List<Ranker> get easyRankers => throw _privateConstructorUsedError;
  List<Ranker> get normalRankers => throw _privateConstructorUsedError;
  List<Ranker> get hardRankers => throw _privateConstructorUsedError;
  List<Ranker> get impossibleRankers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RankBoardCopyWith<RankBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankBoardCopyWith<$Res> {
  factory $RankBoardCopyWith(RankBoard value, $Res Function(RankBoard) then) =
      _$RankBoardCopyWithImpl<$Res>;
  $Res call(
      {List<Ranker> easyRankers,
      List<Ranker> normalRankers,
      List<Ranker> hardRankers,
      List<Ranker> impossibleRankers});
}

/// @nodoc
class _$RankBoardCopyWithImpl<$Res> implements $RankBoardCopyWith<$Res> {
  _$RankBoardCopyWithImpl(this._value, this._then);

  final RankBoard _value;
  // ignore: unused_field
  final $Res Function(RankBoard) _then;

  @override
  $Res call({
    Object? easyRankers = freezed,
    Object? normalRankers = freezed,
    Object? hardRankers = freezed,
    Object? impossibleRankers = freezed,
  }) {
    return _then(_value.copyWith(
      easyRankers: easyRankers == freezed
          ? _value.easyRankers
          : easyRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
      normalRankers: normalRankers == freezed
          ? _value.normalRankers
          : normalRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
      hardRankers: hardRankers == freezed
          ? _value.hardRankers
          : hardRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
      impossibleRankers: impossibleRankers == freezed
          ? _value.impossibleRankers
          : impossibleRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
    ));
  }
}

/// @nodoc
abstract class _$$_RankBoardCopyWith<$Res> implements $RankBoardCopyWith<$Res> {
  factory _$$_RankBoardCopyWith(
          _$_RankBoard value, $Res Function(_$_RankBoard) then) =
      __$$_RankBoardCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Ranker> easyRankers,
      List<Ranker> normalRankers,
      List<Ranker> hardRankers,
      List<Ranker> impossibleRankers});
}

/// @nodoc
class __$$_RankBoardCopyWithImpl<$Res> extends _$RankBoardCopyWithImpl<$Res>
    implements _$$_RankBoardCopyWith<$Res> {
  __$$_RankBoardCopyWithImpl(
      _$_RankBoard _value, $Res Function(_$_RankBoard) _then)
      : super(_value, (v) => _then(v as _$_RankBoard));

  @override
  _$_RankBoard get _value => super._value as _$_RankBoard;

  @override
  $Res call({
    Object? easyRankers = freezed,
    Object? normalRankers = freezed,
    Object? hardRankers = freezed,
    Object? impossibleRankers = freezed,
  }) {
    return _then(_$_RankBoard(
      easyRankers: easyRankers == freezed
          ? _value._easyRankers
          : easyRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
      normalRankers: normalRankers == freezed
          ? _value._normalRankers
          : normalRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
      hardRankers: hardRankers == freezed
          ? _value._hardRankers
          : hardRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
      impossibleRankers: impossibleRankers == freezed
          ? _value._impossibleRankers
          : impossibleRankers // ignore: cast_nullable_to_non_nullable
              as List<Ranker>,
    ));
  }
}

/// @nodoc

class _$_RankBoard implements _RankBoard {
  _$_RankBoard(
      {required final List<Ranker> easyRankers,
      required final List<Ranker> normalRankers,
      required final List<Ranker> hardRankers,
      required final List<Ranker> impossibleRankers})
      : _easyRankers = easyRankers,
        _normalRankers = normalRankers,
        _hardRankers = hardRankers,
        _impossibleRankers = impossibleRankers;

  final List<Ranker> _easyRankers;
  @override
  List<Ranker> get easyRankers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_easyRankers);
  }

  final List<Ranker> _normalRankers;
  @override
  List<Ranker> get normalRankers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_normalRankers);
  }

  final List<Ranker> _hardRankers;
  @override
  List<Ranker> get hardRankers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hardRankers);
  }

  final List<Ranker> _impossibleRankers;
  @override
  List<Ranker> get impossibleRankers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_impossibleRankers);
  }

  @override
  String toString() {
    return 'RankBoard(easyRankers: $easyRankers, normalRankers: $normalRankers, hardRankers: $hardRankers, impossibleRankers: $impossibleRankers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RankBoard &&
            const DeepCollectionEquality()
                .equals(other._easyRankers, _easyRankers) &&
            const DeepCollectionEquality()
                .equals(other._normalRankers, _normalRankers) &&
            const DeepCollectionEquality()
                .equals(other._hardRankers, _hardRankers) &&
            const DeepCollectionEquality()
                .equals(other._impossibleRankers, _impossibleRankers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_easyRankers),
      const DeepCollectionEquality().hash(_normalRankers),
      const DeepCollectionEquality().hash(_hardRankers),
      const DeepCollectionEquality().hash(_impossibleRankers));

  @JsonKey(ignore: true)
  @override
  _$$_RankBoardCopyWith<_$_RankBoard> get copyWith =>
      __$$_RankBoardCopyWithImpl<_$_RankBoard>(this, _$identity);
}

abstract class _RankBoard implements RankBoard {
  factory _RankBoard(
      {required final List<Ranker> easyRankers,
      required final List<Ranker> normalRankers,
      required final List<Ranker> hardRankers,
      required final List<Ranker> impossibleRankers}) = _$_RankBoard;

  @override
  List<Ranker> get easyRankers;
  @override
  List<Ranker> get normalRankers;
  @override
  List<Ranker> get hardRankers;
  @override
  List<Ranker> get impossibleRankers;
  @override
  @JsonKey(ignore: true)
  _$$_RankBoardCopyWith<_$_RankBoard> get copyWith =>
      throw _privateConstructorUsedError;
}
