import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/common/theme.dart';

class MyChatBubble extends StatelessWidget {
  final Message message;
  const MyChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BubbleSpecialThree(
            color: ChatBubbleColors.myBackgroundDark!,
            text: message.content,
            tail: false,
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ChatBubbleColors.myTextDark),
          )
        ],
      ),
    );
  }
}
