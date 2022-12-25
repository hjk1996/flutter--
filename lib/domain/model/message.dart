import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageType {
  giveUp,
  timeOut,
  playing,
  error
}

@freezed
class Message with _$Message {
  factory Message({
    required String id,
    required MessageType messageType,
    required String content,
    required DateTime createdAt,
  }) = _Message;
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  
}


