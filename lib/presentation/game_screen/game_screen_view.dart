import 'package:flutter/material.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/game_screen/components/chat_bubble.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/game_screen/components/dialog.dart';

class GameScreenView extends StatefulWidget {
  const GameScreenView({Key? key}) : super(key: key);

  @override
  State<GameScreenView> createState() => _GameScreenViewState();
}

class _GameScreenViewState extends State<GameScreenView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<GameScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              final isEnd = await showDialog<bool>(
                context: context,
                builder: (context) => const ChatScreenPopButtonDialog(),
              );

              if (isEnd != null && isEnd == true) {
                if (!mounted) return;
                Navigator.pop(context);
                viewModel.resetState();
              }
            },
            icon: Icon(Icons.exit_to_app)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Consumer<GameScreenViewModel>(
                builder: (context, vm, child) {
                  return ListView(
                    children: vm.state.messages
                        .map((message) => ChatBubble(content: message.content))
                        .toList(),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: _controller,
                  )),
                  IconButton(
                      onPressed: () {
                        final isSended =
                            viewModel.sendMessage(_controller.text);

                        if (isSended) {
                          _controller.text = '';
                        }
                      },
                      icon: const Icon(Icons.send)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
