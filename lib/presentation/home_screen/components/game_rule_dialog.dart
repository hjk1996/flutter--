import 'package:flutter/material.dart';

class GameRuleDialog extends StatelessWidget {
  const GameRuleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Dialog(
      child: SizedBox(
        width: mq.size.width * 0.9,
        height: mq.size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            children: [
              Text(
                '게임 규칙',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              SizedBox(
                height: mq.size.height * 0.01,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Text('1'),
                        title: Text(
                            '국립국어원 표준국어대사전에 등록되어 있는 단어 중 3글자인 명사만 사용가능합니다.'),
                      ),
                      ListTile(
                        leading: Text('2'),
                        title: Text('한방단어는 차례가 한 번씩 돌아간 이후 사용할 수 있습니다.'),
                      ),
                      ListTile(
                        leading: Text('3'),
                        title: Text('주어진 시간 안에 올바른 답어를 입력하지 못하면 패배합니다.'),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('확인')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
