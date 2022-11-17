import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/domain/model/message.dart';

part 'game_screen_state.freezed.dart';
part 'game_screen_state.g.dart';

@freezed
class GameScreenState with _$GameScreenState {
  factory GameScreenState(
      {required List<Message> messages,
      Message? lastValidMessage,
      required bool isLoading,
      required bool isPlaying}) = _GameScreenState;
  factory GameScreenState.fromJson(Map<String, dynamic> json) =>
      _$GameScreenStateFromJson(json);
}
