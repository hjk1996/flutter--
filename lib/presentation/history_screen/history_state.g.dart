// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryState _$$_HistoryStateFromJson(Map<String, dynamic> json) =>
    _$_HistoryState(
      isLoading: json['isLoading'] as bool,
      gameLogs: (json['gameLogs'] as List<dynamic>)
          .map((e) => GameLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryStateToJson(_$_HistoryState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'gameLogs': instance.gameLogs,
    };
