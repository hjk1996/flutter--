import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_project/presentation/common/constants.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:provider/provider.dart';

class CountDownTimer extends StatefulWidget {
  final GameDifficulty difficulty;
  late final int turnTime;
  CountDownTimer({required this.difficulty, super.key}) {
    switch (difficulty) {
      case GameDifficulty.easy:
        turnTime = TurnTime.easy;
        break;
      case GameDifficulty.normal:
        turnTime = TurnTime.normal;
        break;
      case GameDifficulty.hard:
        turnTime = TurnTime.hard;
        break;
      case GameDifficulty.impossible:
        turnTime = TurnTime.impossible;
        break;
    }
  }
  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

// 왜 애니메이션 시간이 easy랑 동일한지 디버깅해야함.
class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late final StreamSubscription<RefereeResponse> _subscription;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.turnTime),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    Future.microtask(
      () {
        final viewModel = context.read<GameScreenViewModel>();

        _subscription = viewModel.referee.refereeResponseStream.listen(
          _handleResponse,
        );
      },
    );
  }

  int difficultyToTurnTime(GameDifficulty difficulty) {
    switch (difficulty) {
      case GameDifficulty.easy:
        return TurnTime.easy;
      case GameDifficulty.normal:
        return TurnTime.normal;
      case GameDifficulty.hard:
        return TurnTime.hard;
      case GameDifficulty.impossible:
        return TurnTime.impossible;
    }
  }

  void _handleResponse(RefereeResponse response) {
    if (response.responseTypes == RefereeResponseTypes.askNextMove) {
      final viewModel = context.read<GameScreenViewModel>();
      controller.duration = Duration(
          seconds: difficultyToTurnTime(viewModel.state.setting.difficulty));
      animation = Tween<double>(begin: 0, end: 1).animate(controller);
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
      animation: animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: controller.value,
        );
      },
    );
  }
}
