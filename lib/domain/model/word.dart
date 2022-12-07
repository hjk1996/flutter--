import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';
part 'word.g.dart';

@freezed
class Word with _$Word {
  factory Word({
    @JsonKey(name: 'adjacent_words') required List<dynamic> adjacentWords,
    required bool killer,
    required List<String> meanings
  }) = _Word;
  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
}
