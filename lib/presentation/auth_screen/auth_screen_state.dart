import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_state.freezed.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  factory AuthScreenState({
    required bool isSignIn,
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required Uint8List? image,
    required bool isLoading,
    required bool isValidEmail,
    required bool isValidPassword,
    required bool isValidConfirmPassword,
    required bool isValidName,
  }) = _AuthScreenState;

}
