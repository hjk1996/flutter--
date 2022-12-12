import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_screen_event.freezed.dart';

@freezed
abstract class UserScreenEvent with _$UserScreenEvent {
  const factory UserScreenEvent.onEditPressed() = OnEditPressed;
}
