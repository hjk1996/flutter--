// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameScreenState _$GameScreenStateFromJson(Map<String, dynamic> json) {
  return _GameScreenState.fromJson(json);
}

/// @nodoc
mixin _$GameScreenState {
  List<Message> get messages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameScreenStateCopyWith<GameScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameScreenStateCopyWith<$Res> {
  factory $GameScreenStateCopyWith(
          GameScreenState value, $Res Function(GameScreenState) then) =
      _$GameScreenStateCopyWithImpl<$Res>;
  $Res call({List<Message> messages, bool isLoading, bool isPlaying});
}

/// @nodoc
class _$GameScreenStateCopyWithImpl<$Res>
    implements $GameScreenStateCopyWith<$Res> {
  _$GameScreenStateCopyWithImpl(this._value, this._then);

  final GameScreenState _value;
  // ignore: unused_field
  final $Res Function(GameScreenState) _then;

  @override
  $Res call({
    Object? messages = freezed,
    Object? isLoading = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_GameScreenStateCopyWith<$Res>
    implements $GameScreenStateCopyWith<$Res> {
  factory _$$_GameScreenStateCopyWith(
          _$_GameScreenState value, $Res Function(_$_GameScreenState) then) =
      __$$_GameScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Message> messages, bool isLoading, bool isPlaying});
}

/// @nodoc
class __$$_GameScreenStateCopyWithImpl<$Res>
    extends _$GameScreenStateCopyWithImpl<$Res>
    implements _$$_GameScreenStateCopyWith<$Res> {
  __$$_GameScreenStateCopyWithImpl(
      _$_GameScreenState _value, $Res Function(_$_GameScreenState) _then)
      : super(_value, (v) => _then(v as _$_GameScreenState));

  @override
  _$_GameScreenState get _value => super._value as _$_GameScreenState;

  @override
  $Res call({
    Object? messages = freezed,
    Object? isLoading = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_$_GameScreenState(
      messages: messages == freezed
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameScreenState implements _GameScreenState {
  _$_GameScreenState(
      {required final List<Message> messages,
      required this.isLoading,
      required this.isPlaying})
      : _messages = messages;

  factory _$_GameScreenState.fromJson(Map<String, dynamic> json) =>
      _$$_GameScreenStateFromJson(json);

  final List<Message> _messages;
  @override
  List<Message> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final bool isLoading;
  @override
  final bool isPlaying;

  @override
  String toString() {
    return 'GameScreenState(messages: $messages, isLoading: $isLoading, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameScreenState &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isPlaying));

  @JsonKey(ignore: true)
  @override
  _$$_GameScreenStateCopyWith<_$_GameScreenState> get copyWith =>
      __$$_GameScreenStateCopyWithImpl<_$_GameScreenState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameScreenStateToJson(
      this,
    );
  }
}

abstract class _GameScreenState implements GameScreenState {
  factory _GameScreenState(
      {required final List<Message> messages,
      required final bool isLoading,
      required final bool isPlaying}) = _$_GameScreenState;

  factory _GameScreenState.fromJson(Map<String, dynamic> json) =
      _$_GameScreenState.fromJson;

  @override
  List<Message> get messages;
  @override
  bool get isLoading;
  @override
  bool get isPlaying;
  @override
  @JsonKey(ignore: true)
  _$$_GameScreenStateCopyWith<_$_GameScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
