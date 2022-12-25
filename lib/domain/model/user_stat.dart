import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stat.freezed.dart';
part 'user_stat.g.dart';

@freezed
class UserStat with _$UserStat {
  factory UserStat({
    required String uid,
    required String name,
    required int gameCount,
    required int easyWinCount,
    required int normalWinCount,
    required int hardWinCount,
    required int impossibleWinCount,
    required DateTime lastGameAt,
  }) = _UserStat;
  factory UserStat.fromJson(Map<String, dynamic> json) =>
      _$UserStatFromJson(json);
}
