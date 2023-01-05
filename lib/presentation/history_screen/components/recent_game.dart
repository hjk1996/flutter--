import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:text_project/domain/model/game_log.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';

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

class RecentGame extends StatefulWidget {
  final GameLog gameLog;
  const RecentGame({required this.gameLog, super.key});

  @override
  State<RecentGame> createState() => _RecentGameState();
}

class _RecentGameState extends State<RecentGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              ),
                              right: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              widget.gameLog.win ? '승' : '패',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: widget.gameLog.win
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              difficultyToString(widget.gameLog.difficulty),
                              style: Theme.of(context).textTheme.headline6!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              DateFormat('yyyy년 M월 d일, HH시 mm분')
                                  .format(widget.gameLog.endAt),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '마지막 단어: ${widget.gameLog.log.last.content}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            '게임 길이: ${widget.gameLog.log.length}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
