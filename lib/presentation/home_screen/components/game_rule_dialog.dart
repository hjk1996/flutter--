import 'package:flutter/material.dart';

class GameRuleDialog extends StatelessWidget {
  const GameRuleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(child: LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth * 0.9,
          height: constraints.maxHeight * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              children: [
                const Text('게임 규칙'),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      //TODO: 게임 규칙 만들기
                      children: [],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('확인'))
              ],
            ),
          ),
        );
      },
    ));
  }
}
