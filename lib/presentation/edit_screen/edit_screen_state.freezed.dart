// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditScreenState {
  bool get isNameChange => throw _privateConstructorUsedError;
  bool get isPhotoChange => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Uint8List? get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditScreenStateCopyWith<EditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditScreenStateCopyWith<$Res> {
  factory $EditScreenStateCopyWith(
          EditScreenState value, $Res Function(EditScreenState) then) =
      _$EditScreenStateCopyWithImpl<$Res>;
  $Res call(
      {bool isNameChange,
      bool isPhotoChange,
      bool isLoading,
      String? name,
      Uint8List? photo});
}

/// @nodoc
class _$EditScreenStateCopyWithImpl<$Res>
    implements $EditScreenStateCopyWith<$Res> {
  _$EditScreenStateCopyWithImpl(this._value, this._then);

  final EditScreenState _value;
  // ignore: unused_field
  final $Res Function(EditScreenState) _then;

  @override
  $Res call({
    Object? isNameChange = freezed,
    Object? isPhotoChange = freezed,
    Object? isLoading = freezed,
    Object? name = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      isNameChange: isNameChange == freezed
          ? _value.isNameChange
          : isNameChange // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhotoChange: isPhotoChange == freezed
          ? _value.isPhotoChange
          : isPhotoChange // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
abstract class _$$_EditScreenStateCopyWith<$Res>
    implements $EditScreenStateCopyWith<$Res> {
  factory _$$_EditScreenStateCopyWith(
          _$_EditScreenState value, $Res Function(_$_EditScreenState) then) =
      __$$_EditScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isNameChange,
      bool isPhotoChange,
      bool isLoading,
      String? name,
      Uint8List? photo});
}

/// @nodoc
class __$$_EditScreenStateCopyWithImpl<$Res>
    extends _$EditScreenStateCopyWithImpl<$Res>
    implements _$$_EditScreenStateCopyWith<$Res> {
  __$$_EditScreenStateCopyWithImpl(
      _$_EditScreenState _value, $Res Function(_$_EditScreenState) _then)
      : super(_value, (v) => _then(v as _$_EditScreenState));

  @override
  _$_EditScreenState get _value => super._value as _$_EditScreenState;

  @override
  $Res call({
    Object? isNameChange = freezed,
    Object? isPhotoChange = freezed,
    Object? isLoading = freezed,
    Object? name = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$_EditScreenState(
      isNameChange: isNameChange == freezed
          ? _value.isNameChange
          : isNameChange // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhotoChange: isPhotoChange == freezed
          ? _value.isPhotoChange
          : isPhotoChange // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$_EditScreenState implements _EditScreenState {
  _$_EditScreenState(
      {required this.isNameChange,
      required this.isPhotoChange,
      required this.isLoading,
      required this.name,
      required this.photo});

  @override
  final bool isNameChange;
  @override
  final bool isPhotoChange;
  @override
  final bool isLoading;
  @override
  final String? name;
  @override
  final Uint8List? photo;

  @override
  String toString() {
    return 'EditScreenState(isNameChange: $isNameChange, isPhotoChange: $isPhotoChange, isLoading: $isLoading, name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditScreenState &&
            const DeepCollectionEquality()
                .equals(other.isNameChange, isNameChange) &&
            const DeepCollectionEquality()
                .equals(other.isPhotoChange, isPhotoChange) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photo, photo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isNameChange),
      const DeepCollectionEquality().hash(isPhotoChange),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photo));

  @JsonKey(ignore: true)
  @override
  _$$_EditScreenStateCopyWith<_$_EditScreenState> get copyWith =>
      __$$_EditScreenStateCopyWithImpl<_$_EditScreenState>(this, _$identity);
}

abstract class _EditScreenState implements EditScreenState {
  factory _EditScreenState(
      {required final bool isNameChange,
      required final bool isPhotoChange,
      required final bool isLoading,
      required final String? name,
      required final Uint8List? photo}) = _$_EditScreenState;

  @override
  bool get isNameChange;
  @override
  bool get isPhotoChange;
  @override
  bool get isLoading;
  @override
  String? get name;
  @override
  Uint8List? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_EditScreenStateCopyWith<_$_EditScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
