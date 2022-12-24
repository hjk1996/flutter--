import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_screen_event.freezed.dart';

@freezed
abstract class UserScreenEvent with _$UserScreenEvent {
  const factory UserScreenEvent.onEditPressed() = OnEditPressed;
  const factory UserScreenEvent.onSave() = OnSave;
  const factory UserScreenEvent.onProfileTap() = OnProfileTap;
  const factory UserScreenEvent.onVerifyEmailTap(bool alreadyVerified) = OnVerifyEmailTap;
  const factory UserScreenEvent.onDeleteAccountTap() = OnDeleteAccountTap;
  const factory UserScreenEvent.onError(String message) = OnError;

}
