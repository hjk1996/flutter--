import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_project/presentation/game_screen/components/app_bar.dart';
import 'package:text_project/presentation/game_screen/components/chat_input_box.dart';
import 'package:text_project/presentation/game_screen/components/my_chat_bubble.dart';
import 'package:text_project/presentation/game_screen/components/your_chat_bubble.dart';
import 'package:text_project/presentation/game_screen/game_screen_event.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/game_screen/components/chat_bubble.dart';
import 'package:provider/provider.dart';

class GameScreenView extends StatefulWidget {
  const GameScreenView({Key? key}) : super(key: key);

  @override
  State<GameScreenView> createState() => _GameScreenViewState();
}

class _GameScreenViewState extends State<GameScreenView> {
  final _controller = TextEditingController();
  StreamSubscription<GameScreenEvent>? _subscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        final viewModel = context.read<GameScreenViewModel>();
        _subscription = viewModel.eventStream.listen(
          (event) {
            event.when(
              onPlaying: () {},
              onFinishStep: () {},
              onError: (message) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('확인'),
                      )
                    ],
                  ),
                );
              },
              onPlayerWin: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('승리했습니다!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('다시 하기'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('나가기'),
                      )
                    ],
                  ),
                );
              },
              onAIWin: () {},
            );
          },
        );
      },
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await context.read<GameScreenViewModel>().startGame();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<GameScreenViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GameScreenAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Consumer<GameScreenViewModel>(
                    builder: (context, vm, child) {
                      return SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          children: vm.state.messages
                              .map(
                                (message) => message.id ==
                                        FirebaseAuth.instance.currentUser!.uid
                                    ? MyChatBubble(
                                        content: message.content,
                                      )
                                    : YourChatBubble(
                                        content: message.content,
                                        isErrorMessage: message.isErrorMessage,
                                      ),
                              )
                              .toList()
                              .reversed
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            ChatInputBox(
              controller: _controller,
              onSendPressed: () async {
                final String message = _controller.text;
                _controller.clear();
                await viewModel.sendMessage(message);
              },
            ),
          ],
        ),
      ),
    );
  }
}
