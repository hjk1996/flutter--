import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_project/presentation/game_screen/components/app_bar.dart';
import 'package:text_project/presentation/game_screen/components/chat_input_box.dart';
import 'package:text_project/presentation/game_screen/components/my_chat_bubble.dart';
import 'package:text_project/presentation/game_screen/components/opponent_chat_bubble.dart';
import 'package:text_project/presentation/game_screen/components/slidable_chaut_bubble.dart';
import 'package:text_project/presentation/game_screen/game_screen_event.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:provider/provider.dart';

class GameScreenView extends StatefulWidget {
  const GameScreenView({Key? key}) : super(key: key);

  @override
  State<GameScreenView> createState() => _GameScreenViewState();
}

class _GameScreenViewState extends State<GameScreenView> {
  StreamSubscription<GameScreenEvent>? _gameScreenEventsubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        final viewModel = context.read<GameScreenViewModel>();
        viewModel.init();
        _gameScreenEventsubscription = viewModel.eventStream.listen(
          (event) {
            event.when(
              onError: (message) {},
              onSaveWord: (word) {},
              onGameEnd: (response) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        response.target ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? '패배했습니다.'
                            : '승리했습니다.',
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'))
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _gameScreenEventsubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const GameScreenAppBar(),
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
                                        message: message,
                                      )
                                    : vm.state.isPlaying
                                        ? OpponentChatBubble(
                                            message: message,
                                          )
                                        : SlidableChatBubble(
                                            message: message,
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
            const ChatInputBox()
          ],
        ),
      ),
    );
  }
}
