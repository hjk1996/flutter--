import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/components/game_setting_dialog.dart';

part 'game_screen_state.freezed.dart';

@freezed
class GameScreenState with _$GameScreenState {
  factory GameScreenState({
    required List<Message> messages,
    required GameSetting setting,
    required bool isLoading,
    required bool isPlaying,
  }) = _GameScreenState;
}
