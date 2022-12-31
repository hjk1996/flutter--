// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameLog _$$_GameLogFromJson(Map<String, dynamic> json) => _$_GameLog(
      id: json['id'],
      difficulty: $enumDecode(_$GameDifficultyEnumMap, json['difficulty']),
      endAt: DateTime.parse(json['endAt']),
      win: json['win'] as bool,
      log: (json['log'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GameLogToJson(_$_GameLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'difficulty': _$GameDifficultyEnumMap[instance.difficulty]!,
      'endAt': instance.endAt.toIso8601String(),
      'win': instance.win,
      'log': instance.log.map((e) => e.toJson()).toList(),
    };

const _$GameDifficultyEnumMap = {
  GameDifficulty.easy: 'easy',
  GameDifficulty.normal: 'normal',
  GameDifficulty.hard: 'hard',
  GameDifficulty.impossible: 'impossible',
};
