import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_screen_event.freezed.dart';


@freezed
abstract class AuthScreenEvent with _$AuthScreenEvent {
  const factory AuthScreenEvent.onAuthError(String message) = OnAuthError;
  const factory AuthScreenEvent.onSignInSuccess() = OnSignInSuccess;
  const factory AuthScreenEvent.onSignUpSuccess() = OnSignUpSuccess;
  const factory AuthScreenEvent.whenEmailUsable() = WhenEmailUsable;
  const factory AuthScreenEvent.onProfileTap() = OnProfileTap;

}