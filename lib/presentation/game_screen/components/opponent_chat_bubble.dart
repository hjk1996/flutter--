import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/common/constants.dart';
import 'package:text_project/presentation/common/theme.dart';

class OpponentChatBubble extends StatefulWidget {
  final Message message;
  const OpponentChatBubble({super.key, required this.message});

  @override
  State<OpponentChatBubble> createState() => _OpponentChatBubbleState();
}

class _OpponentChatBubbleState extends State<OpponentChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(widget.message.id == REFEREE_ID
                ? 'assets/images/game_screen/referee.png'
                : 'assets/images/game_screen/robot.png'),
          ),
          BubbleSpecialThree(
            color: widget.message.id == REFEREE_ID
                ? ChatBubbleColors.refereeBackgroundDark
                : ChatBubbleColors.yourBackgroundDark,
            text: widget.message.content,
            tail: false,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: widget.message.id == REFEREE_ID
                      ? ChatBubbleColors.refereeTextDark
                      : ChatBubbleColors.yourTextDark,
                ),
          )
        ],
      ),
    );
  }
}
