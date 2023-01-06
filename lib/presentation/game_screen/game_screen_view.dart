import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_project/presentation/common/constants.dart';
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
  late StreamSubscription<GameScreenEvent> _gameScreenEventsubscription;

  BannerAd banner = BannerAd(
    size: AdSize.banner,
    adUnitId: UNIT_ID['android']!,
    listener: const BannerAdListener(),
    request: const AdRequest(),
  )..load();

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
              onError: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 3),
                    content: Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              onSaveWord: (word) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text(
                      '단어장에 "$word"를 저장했습니다',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
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
    _gameScreenEventsubscription.cancel();
    super.dispose();
    banner.dispose();
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
                          children: [
                            ...vm.state.messages
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
                            if (!vm.state.isPlaying &&
                                vm.state.messages.isNotEmpty)
                              const Text(
                                '단어를 슬라이드한 후 저장한 뒤\n단어장에서 뜻을 확인할 수 있습니다.',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Consumer<GameScreenViewModel>(
              builder: (context, vm, child) {
                return vm.state.isPlaying
                    ? const ChatInputBox()
                    : SizedBox(
                        height: 50,
                        child: AdWidget(
                          ad: banner,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
