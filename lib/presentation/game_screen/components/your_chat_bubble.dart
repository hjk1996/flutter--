import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class YourChatBubble extends StatelessWidget {
  final String content;
  const YourChatBubble({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(child: Icon(Icons.person)),
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
