import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_event.freezed.dart';

@freezed
abstract class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.onGameStartPressed() = OnGameStartPressed;
  const factory HomeScreenEvent.onLogoutPressed() = OnLogoutPressed;
}
