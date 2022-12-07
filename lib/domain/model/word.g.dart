// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      adjacentWords: json['adjacent_words'] as List<dynamic>,
      killer: json['killer'] as bool,
      meanings:
          (json['meanings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'adjacent_words': instance.adjacentWords,
      'killer': instance.killer,
      'meanings': instance.meanings,
    };
