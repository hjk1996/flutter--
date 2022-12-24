import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';

class GameSetting {
  final bool isPlayerFirst;
  final GameDifficulty difficulty;
  const GameSetting({required this.isPlayerFirst, required this.difficulty});
}

class GameSettingDialog extends StatefulWidget {
  const GameSettingDialog({super.key});

  @override
  State<GameSettingDialog> createState() => _GameSettingDialogState();
}

class _GameSettingDialogState extends State<GameSettingDialog> {
  bool _isPlayerFirst = true;
  GameDifficulty _difficulty = GameDifficulty.easy;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Dialog(
      child: SizedBox(
        width: mq.size.width * 0.6,
        height: mq.size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '게임 설정',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              Row(
                children: [
                  Text(
                    '공격 순서',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('선공'),
                        Radio(
                          value: true,
                          groupValue: _isPlayerFirst,
                          onChanged: (value) {
                            setState(() {
                              _isPlayerFirst = value as bool;
                            });
                          },
                        ),
                        const Text('후공'),
                        Radio(
                          value: false,
                          groupValue: _isPlayerFirst,
                          onChanged: (value) {
                            setState(() {
                              _isPlayerFirst = value as bool;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Text(
                    '난이도',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton<GameDifficulty>(
                          isDense: true,
                          underline: Container(color: Colors.transparent),
                          items: const [
                            DropdownMenuItem(
                              value: GameDifficulty.easy,
                              child: Text('쉬움'),
                            ),
                            DropdownMenuItem(
                              value: GameDifficulty.normal,
                              child: Text('보통'),
                            ),
                            DropdownMenuItem(
                              value: GameDifficulty.hard,
                              child: Text('어려움'),
                            ),
                            DropdownMenuItem(
                              value: GameDifficulty.impossible,
                              child: Text('매우 어려움'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _difficulty = value!;
                            });
                          },
                          value: _difficulty,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        GameSetting(
                            isPlayerFirst: _isPlayerFirst,
                            difficulty: _difficulty),
                      );
                    },
                    child: const Text('게임 시작'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('취소 '),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
