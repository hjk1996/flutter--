// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameLog _$$_GameLogFromJson(Map<String, dynamic> json) => _$_GameLog(
      difficulty: $enumDecode(_$GameDifficultyEnumMap, json['difficulty']),
      endAt: DateTime.parse(json['endAt'] as String),
      id: json['id'] as String,
      win: json['win'] as bool,
      log: (json['log'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GameLogToJson(_$_GameLog instance) =>
    <String, dynamic>{
      'difficulty': _$GameDifficultyEnumMap[instance.difficulty]!,
      'endAt': instance.endAt.toIso8601String(),
      'id': instance.id,
      'win': instance.win,
      'log': instance.log.map((e) => e.toJson()).toList(),
    };

const _$GameDifficultyEnumMap = {
  GameDifficulty.easy: 'easy',
  GameDifficulty.normal: 'normal',
  GameDifficulty.hard: 'hard',
  GameDifficulty.impossible: 'impossible',
};
