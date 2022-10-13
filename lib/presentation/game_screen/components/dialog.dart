import 'package:flutter/material.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';
import 'package:provider/provider.dart';

class ChatScreenPopButtonDialog extends StatelessWidget {
  const ChatScreenPopButtonDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      contentPadding: const EdgeInsets.only(top: 20.0),
      content: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        child: SizedBox(
          width: 170,
          height: 150,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                '게임에서 나가겠습니까?',
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: const Border(
                            top: BorderSide(width: 2), right: BorderSide()),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 70,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text(
                          '나가기',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: const Border(
                            top: BorderSide(width: 2), left: BorderSide()),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 70,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text(
                          '계속하기',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
