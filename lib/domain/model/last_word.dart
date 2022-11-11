import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/domain/model/word.dart';

part 'last_word.freezed.dart';
part 'last_word.g.dart';

@freezed
class LastWord with _$LastWord {
  factory LastWord({
    @JsonKey(name: 'following_words')
        required List<FollowingWord> followingWords,
    required bool killer,
  }) = _LastWord;
  factory LastWord.fromJson(Map<String, dynamic> json) =>
      _$LastWordFromJson(json);

}

@freezed
class FollowingWord with _$FollowingWord {
  @JsonSerializable(explicitToJson: true)
  factory FollowingWord({required String word, required bool killer}) =
      _FollowingWord;

  factory FollowingWord.fromJson(Map<String, dynamic> json) =>
      _$FollowingWordFromJson(json);
}
