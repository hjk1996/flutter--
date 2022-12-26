import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_event.freezed.dart';

@freezed
abstract class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.onError(String message) = OnError;
  const factory HomeScreenEvent.onGameStart() = OnGameStart;
  const factory HomeScreenEvent.onLogoutPressed() = OnLogoutPressed;
}
