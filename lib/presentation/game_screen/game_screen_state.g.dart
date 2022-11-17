// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameScreenState _$$_GameScreenStateFromJson(Map<String, dynamic> json) =>
    _$_GameScreenState(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastWord: json['lastWord'] as String?,
      isLoading: json['isLoading'] as bool,
      isGameFinished: json['isGameFinished'] as bool,
    );

Map<String, dynamic> _$$_GameScreenStateToJson(_$_GameScreenState instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'lastWord': instance.lastWord,
      'isLoading': instance.isLoading,
      'isGameFinished': instance.isGameFinished,
    };
