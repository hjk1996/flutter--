

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';


part 'game_screen_event.freezed.dart';


@freezed
abstract class GameScreenEvent with _$GameScreenEvent {

  
  const factory GameScreenEvent.onError(RefereeResponse response) = OnError;
  const factory GameScreenEvent.onGameEnd(RefereeResponse response) = OnGameEnd;

}