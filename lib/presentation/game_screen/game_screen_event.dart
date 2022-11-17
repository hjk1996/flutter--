

import 'package:freezed_annotation/freezed_annotation.dart';


part 'game_screen_event.freezed.dart';


@freezed
abstract class GameScreenEvent with _$GameScreenEvent {

  
  const factory GameScreenEvent.onPlaying() = OnPlaying;
  const factory GameScreenEvent.onError(String message) = OnError;
  const factory GameScreenEvent.onPlayerWin() = OnPlayerWin;
  const factory GameScreenEvent.onPlayerLose() = OnPlayerLose;
  const factory GameScreenEvent.onFinishStep() = OnFinishStep;

}