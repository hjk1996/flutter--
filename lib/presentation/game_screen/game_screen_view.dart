import 'package:flutter/material.dart';
import 'package:text_project/presentation/common/asking_dialog.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/game_screen/components/chat_bubble.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';

class GameScreenView extends StatefulWidget {
  const GameScreenView({Key? key}) : super(key: key);

  @override
  State<GameScreenView> createState() => _GameScreenViewState();
}

class _GameScreenViewState extends State<GameScreenView> {
  final _controller = TextEditingController();

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await context.read<GameScreenViewModel>().startGame();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<GameScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              final isEnd = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text('게임에서 나가시겠습니까?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('네'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('아니요'),
                    ),
                  ],
                ),
              );

              if (isEnd != null && isEnd == true) {
                if (!mounted) return;
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.exit_to_app)),
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
                        .map(
                          (message) => ChatBubble(content: message.content),
                        )
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
                      onPressed: () async {
                        final String message = _controller.text;
                        _controller.text = '';
                        await viewModel.sendMessage(message);
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
