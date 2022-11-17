import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String content;

  const ChatBubble({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: content,
      tail: false,
      color: Colors.blue,
      textStyle: Theme.of(context).textTheme.bodyMedium!,
      
    );
  }
}
