import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';

class ChatInputBox extends StatefulWidget {
  const ChatInputBox({super.key});

  @override
  State<ChatInputBox> createState() => _ChatInputBoxState();
}

class _ChatInputBoxState extends State<ChatInputBox> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
            ),
          ),
          Consumer<GameScreenViewModel>(
            builder: (context, vm, child) {
              return IconButton(
                onPressed: vm.referee.playerOnTurn?.id! ==
                        FirebaseAuth.instance.currentUser!.uid
                    ? () async {
                        await vm.sendMessage(_controller.text);
                        _controller.clear();
                      }
                    : null,
                icon: const Icon(Icons.send),
              );
            },
          ),
        ],
      ),
    );
  }
}
