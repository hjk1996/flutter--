import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/domain/model/ranker.dart';

part 'rank_board.freezed.dart';

@freezed
class RankBoard with _$RankBoard {
  factory RankBoard({
    required List<Ranker> easyRankers,
    required List<Ranker> normalRankers,
    required List<Ranker> hardRankers,
    required List<Ranker> impossibleRankers,
  }) = _RankBoard;
}
