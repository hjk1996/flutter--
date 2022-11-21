import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageType {
  giveUp, playing
}


@freezed
class Message with _$Message {
  factory Message({
    required String id,
    required MessageType messageType,
    required String content,
    required int createdAt,
  }) = _Message;
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
