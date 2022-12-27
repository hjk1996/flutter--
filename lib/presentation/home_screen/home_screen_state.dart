import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/domain/model/rank_board.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  factory HomeScreenState({
    required bool isLoading,
    required RankBoard? rankBoard,
  }) = _HomeScreenState;
}
