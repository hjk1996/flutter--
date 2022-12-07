import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/common/constants.dart';
import 'package:text_project/presentation/common/theme.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';

class SlidableChatBubble extends StatefulWidget {
  final Message message;
  const SlidableChatBubble({super.key, required this.message});

  @override
  State<SlidableChatBubble> createState() => _SlidableChatBubbleState();
}

class _SlidableChatBubbleState extends State<SlidableChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        direction: Axis.horizontal,
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.15,
          children: [
            SlidableAction(
              backgroundColor: Theme.of(context).backgroundColor,
              onPressed: (context) async {
                await context
                    .read<GameScreenViewModel>()
                    .saveWord(widget.message.content);
                
              },
              icon: Icons.bookmark,
              foregroundColor: Colors.white,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Icon(widget.message.id == REFEREE_ID
                  ? Icons.emoji_people_rounded
                  : Icons.person),
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
      ),
    );
  }
}
