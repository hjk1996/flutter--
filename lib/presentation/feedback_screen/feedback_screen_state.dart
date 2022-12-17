import 'package:freezed_annotation/freezed_annotation.dart';


part 'feedback_screen_state.freezed.dart';


@freezed
class FeedbackScreenState with _$FeedbackScreenState {
  factory FeedbackScreenState({required bool isLoading}) = _FeedbackScreenState;

}