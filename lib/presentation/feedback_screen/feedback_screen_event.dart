
import 'package:freezed_annotation/freezed_annotation.dart';


part 'feedback_screen_event.freezed.dart';


@freezed
abstract class FeedbackScreenEvent with _$FeedbackScreenEvent {
  const factory FeedbackScreenEvent.onSuccess() = OnSuccess;
  const factory FeedbackScreenEvent.onError(String message) = OnError;
}