import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_screen_event.freezed.dart';

@freezed
abstract class EditScreenEvent with _$EditScreenEvent {
  const factory EditScreenEvent.onSave() = OnSave;
  const factory EditScreenEvent.onProfileTap() = OnProfileTap;
  const factory EditScreenEvent.onError(String message) = OnError;
}
