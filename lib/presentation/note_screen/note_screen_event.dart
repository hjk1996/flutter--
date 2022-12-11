import 'package:freezed_annotation/freezed_annotation.dart';


part 'note_screen_event.freezed.dart';


@freezed
abstract class NoteScreenEvent with _$NoteScreenEvent {
  const factory NoteScreenEvent.onDelete(String word) = OnDelete;
}