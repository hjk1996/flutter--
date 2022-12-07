// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteItem _$$_NoteItemFromJson(Map<String, dynamic> json) => _$_NoteItem(
      word: json['word'] as String,
      meanings:
          (json['meanings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_NoteItemToJson(_$_NoteItem instance) =>
    <String, dynamic>{
      'word': instance.word,
      'meanings': instance.meanings,
    };
