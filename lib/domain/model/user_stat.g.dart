// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserStat _$$_UserStatFromJson(Map<String, dynamic> json) => _$_UserStat(
      gameCount: json['gameCount'] as int,
      easyWinCount: json['easyWinCount'] as int,
      normalWinCount: json['normalWinCount'] as int,
      hardWinCount: json['hardWinCount'] as int,
      impossibleWinCount: json['impossibleWinCount'] as int,
      lastGameAt: DateTime.fromMicrosecondsSinceEpoch(
        json['lastGameAt'] as int,
      ),
    );

Map<String, dynamic> _$$_UserStatToJson(_$_UserStat instance) =>
    <String, dynamic>{
      'gameCount': instance.gameCount,
      'easyWinCount': instance.easyWinCount,
      'normalWinCount': instance.normalWinCount,
      'hardWinCount': instance.hardWinCount,
      'impossibleWinCount': instance.impossibleWinCount,
      'lastGameAt': instance.lastGameAt.toIso8601String(),
    };
