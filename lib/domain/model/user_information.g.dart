// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInformation _$$_UserInformationFromJson(Map<String, dynamic> json) =>
    _$_UserInformation(
      name: json['name'] ,
      photoUrl: json['photoUrl'] ,
      gameCount: json['gameCount'] ?? 0,
      easyWinCount: json['easyWinCount'] ?? 0,
      normalWinCount: json['normalWinCount'] ?? 0,
      hardWinCount: json['hardWinCount'] ?? 0,
      impossibleWinCount: json['impossibleWinCount'] ?? 0,
      lastGameAt: json['lastGameAt'] == null
          ? null
          : DateTime.parse(json['lastGameAt'] ),
    );

Map<String, dynamic> _$$_UserInformationToJson(_$_UserInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'gameCount': instance.gameCount,
      'easyWinCount': instance.easyWinCount,
      'normalWinCount': instance.normalWinCount,
      'hardWinCount': instance.hardWinCount,
      'impossibleWinCount': instance.impossibleWinCount,
      'lastGameAt': instance.lastGameAt?.toIso8601String(),
    };
