import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information.freezed.dart';
part 'user_information.g.dart';

@freezed
class UserInformation with _$UserInformation {
  factory UserInformation({
    required String name,
    required String? photoUrl,
    required int gameCount,
    required int easyWinCount,
    required int normalWinCount,
    required int hardWinCount,
    required int impossibleWinCount,
    required DateTime? lastGameAt,
  }) = _UserInformation;
  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);
}
