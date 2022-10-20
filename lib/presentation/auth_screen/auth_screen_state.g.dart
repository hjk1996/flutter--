// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthScreenState _$$_AuthScreenStateFromJson(Map<String, dynamic> json) =>
    _$_AuthScreenState(
      isSignIn: json['isSignIn'] as bool,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      isValidEmail: json['isValidEmail'] as bool,
      isValidPassword: json['isValidPassword'] as bool,
      isValidConfirmPassword: json['isValidConfirmPassword'] as bool,
    );

Map<String, dynamic> _$$_AuthScreenStateToJson(_$_AuthScreenState instance) =>
    <String, dynamic>{
      'isSignIn': instance.isSignIn,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'isValidEmail': instance.isValidEmail,
      'isValidPassword': instance.isValidPassword,
      'isValidConfirmPassword': instance.isValidConfirmPassword,
    };
