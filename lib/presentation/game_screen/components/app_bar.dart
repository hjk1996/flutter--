import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/common/constants.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:get_it/get_it.dart';

class GameScreenAppBar extends StatefulWidget with PreferredSizeWidget {
  const GameScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<GameScreenAppBar> createState() => _GameScreenAppBarState();
}

class _GameScreenAppBarState extends State<GameScreenAppBar>
    with TickerProviderStateMixin {
  // final AnimationController controller = AnimationController(
  //   vsync: this.,
  //   duration: const Duration(seconds: 200),
  // );

  final Stopwatch stopwatch = Stopwatch();

  StreamSubscription<RefereeResponse>? _refereeResponseSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<GameScreenViewModel>();
      _refereeResponseSubscription =
          viewModel.referee.refereeResponseStream.listen((response) {
        if (response.responseTypes == RefereeResponseTypes.askNextMove) {
          stopwatch.reset();
          stopwatch.start();
        }
      });
    });
  }

  @override
  void dispose() {
    _refereeResponseSubscription?.cancel();
    super.dispose();
  }

  void _unfocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameScreenViewModel>(
      builder: (context, viewModel, child) {
        return AppBar(
          leading: IconButton(
            onPressed: () async {
              _unfocus();
              final answer =
                  await askYesOrNo(context: context, content: '게임에서 나가겠습니까?');
              if (answer == true && mounted) {
                viewModel.endGame();
                viewModel.resetChat();
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.exit_to_app),
          ),
          title: Column(
            children: [
              Text(
                viewModel.referee.usedWords.isNotEmpty &&
                        viewModel.state.isPlaying
                    ? viewModel.referee.usedWords.last
                    : '',
              ),
              const CountDownTimer()
            ],
          ),
          actions: [
            IconButton(
              onPressed: () async {
                _unfocus();
                if (viewModel.state.isPlaying) {
                  final answer = await askYesOrNo(
                      context: context, content: '게임을 포기하시겠습니까?');
                  if (answer == null || answer == false || !mounted) return;
                  if (answer == true) {
                    // 여기서 로그를 두번 보냄.
                    viewModel.referee.receiveMessage(
                      Message(
                        id: FirebaseAuth.instance.currentUser!.uid,
                        messageType: MessageType.giveUp,
                        content: '',
                        createdAt: DateTime.now().microsecondsSinceEpoch,
                      ),
                    );
                    viewModel.endGame();
                  }
                } else {
                  final answer = await askYesOrNo(
                    context: context,
                    content: '먼저 공격하시겠습니까?',
                    cancelDialog: true,
                  );
                  if (answer == null) return;
                  // check whether internet is connected before starting game
                  final connectionStatus = await GetIt.instance
                      .get<Connectivity>()
                      .checkConnectivity();

                  if (connectionStatus == ConnectivityResult.none) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('인터넷 연결이 되어있지 않습니다.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('확인'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  viewModel.startGame(answer);
                }
              },
              icon: Icon(
                  viewModel.state.isPlaying ? Icons.stop : Icons.play_arrow),
            )
          ],
        );
      },
    );
  }
}

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late final StreamSubscription<RefereeResponse> _subscription;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: TURN_TIME),
    );
    animation = Tween<double>(begin: .0, end: 1.0).animate(controller)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {}
        },
      );

    Future.microtask(
      () {
        final viewModel = context.read<GameScreenViewModel>();
        _subscription = viewModel.referee.refereeResponseStream.listen(
          _handleResponse,
        );
      },
    );
  }

  void _handleResponse(RefereeResponse response) {
    if (response.responseTypes == RefereeResponseTypes.askNextMove) {
      controller.reset();
      controller.forward();
    }

    if (response.responseTypes == RefereeResponseTypes.gameEnd) {
      controller.reset();
      context.read<GameScreenViewModel>().endGame();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: controller.value,
        );
      },
    );
  }
}
