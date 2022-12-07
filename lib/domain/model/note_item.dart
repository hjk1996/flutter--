import 'package:freezed_annotation/freezed_annotation.dart';


part 'note_item.freezed.dart';
part 'note_item.g.dart';


@freezed
class NoteItem with _$NoteItem {
  factory NoteItem({required String word, required List<String> meanings}) = _NoteItem;
  factory NoteItem.fromJson(Map<String, dynamic> json) =>
    _$NoteItemFromJson(json);
}