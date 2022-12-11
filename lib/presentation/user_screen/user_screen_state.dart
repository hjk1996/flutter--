import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_screen_state.freezed.dart';
part 'user_screen_state.g.dart';

@freezed
class UserScreenState with _$UserScreenState {
  factory UserScreenState() = _UserScreenState;
  factory UserScreenState.fromJson(Map<String, dynamic> json) =>
      _$UserScreenStateFromJson(json);
}
