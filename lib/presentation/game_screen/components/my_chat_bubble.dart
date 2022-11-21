import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class MyChatBubble extends StatelessWidget {
  final String content;
  const MyChatBubble({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BubbleSpecialThree(
            text: content,
            tail: false,
            textStyle: Theme.of(context).textTheme.bodyMedium!,
          )
        ],
      ),
    );
  }
}
