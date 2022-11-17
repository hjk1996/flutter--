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
      lastValidMessage: json['lastValidMessage'] == null
          ? null
          : Message.fromJson(json['lastValidMessage'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool,
      isPlaying: json['isPlaying'] as bool,
    );

Map<String, dynamic> _$$_GameScreenStateToJson(_$_GameScreenState instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'lastValidMessage': instance.lastValidMessage,
      'isLoading': instance.isLoading,
      'isPlaying': instance.isPlaying,
    };
