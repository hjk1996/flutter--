// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LastWord _$$_LastWordFromJson(Map<String, dynamic> json) => _$_LastWord(
      followingWords: (json['following_words'] as List<dynamic>)
          .map((e) => FollowingWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      killer: json['killer'] as bool,
    );

Map<String, dynamic> _$$_LastWordToJson(_$_LastWord instance) =>
    <String, dynamic>{
      'following_words': instance.followingWords,
      'killer': instance.killer,
    };

_$_FollowingWord _$$_FollowingWordFromJson(Map<String, dynamic> json) =>
    _$_FollowingWord(
      word: json['word'] as String,
      killer: json['killer'] as bool,
    );

Map<String, dynamic> _$$_FollowingWordToJson(_$_FollowingWord instance) =>
    <String, dynamic>{
      'word': instance.word,
      'killer': instance.killer,
    };
