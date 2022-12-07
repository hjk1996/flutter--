// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String,
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
      content: json['content'] as String,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };

const _$MessageTypeEnumMap = {
  MessageType.giveUp: 'giveUp',
  MessageType.timeOut: 'timeOut',
  MessageType.playing: 'playing',
  MessageType.error: 'error',
};
