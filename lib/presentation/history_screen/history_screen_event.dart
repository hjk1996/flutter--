import 'package:freezed_annotation/freezed_annotation.dart';


part 'history_screen_event.freezed.dart';


@freezed
abstract class HistoryScreenEvent with _$HistoryScreenEvent {
  const factory HistoryScreenEvent.onError(String message) = OnError;
}