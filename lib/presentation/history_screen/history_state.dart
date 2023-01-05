


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/domain/model/game_log.dart';


part 'history_state.freezed.dart';
part 'history_state.g.dart';


@freezed
class HistoryState with _$HistoryState {
  factory HistoryState(

    {
      required bool isLoading,
      required List<GameLog> gameLogs,
    }
  ) = _HistoryState;
  factory HistoryState.fromJson(Map<String, dynamic> json) =>
    _$HistoryStateFromJson(json);
}