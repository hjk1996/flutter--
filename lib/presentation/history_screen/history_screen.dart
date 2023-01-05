import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';
import 'package:text_project/presentation/history_screen/components/recent_game.dart';
import 'package:text_project/presentation/history_screen/history_view_model.dart';

String difficultyToString(GameDifficulty difficulty) {
  switch (difficulty) {
    case GameDifficulty.easy:
      return '쉬움';
    case GameDifficulty.normal:
      return '보통';
    case GameDifficulty.hard:
      return '어려움';
    case GameDifficulty.impossible:
      return '매우 어려움';
  }
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<HistoryViewModel>().fetchRecentGames();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('최근 전적'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Consumer<HistoryViewModel>(
            builder: (context, vm, child) {
              if (vm.state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (vm.state.gameLogs.isEmpty) {
                return const Center(child: Text('최근 전적이 없습니다.'));
              }
              return Column(
                children: vm.state.gameLogs
                    .map((log) => RecentGame(gameLog: log))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
