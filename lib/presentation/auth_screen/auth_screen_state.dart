import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_state.freezed.dart';
part 'auth_screen_state.g.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  factory AuthScreenState({
    required bool isSignIn,
    required String email,
    required String password,
    required String confirmPassword,
    required bool isValidEmail,
    required bool isValidPassword,
    required bool isValidConfirmPassword,
  }) = _AuthScreenState;
  factory AuthScreenState.fromJson(Map<String, dynamic> json) =>
      _$AuthScreenStateFromJson(json);
}
