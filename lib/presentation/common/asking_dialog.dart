import 'package:flutter/material.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';
import 'package:provider/provider.dart';

class AskingDialog extends StatelessWidget {
  final String message;
  final String agreeText;
  final String disagreeText;
  const AskingDialog({
    Key? key,
    required this.message,
    required this.agreeText,
    required this.disagreeText,
  }) : super(key: key);

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
              Text(
                message,
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
                          // top: BorderSide(width: 2, color: Colors.white),
                          right: BorderSide(color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 70,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text(
                          agreeText,
                          style: const TextStyle(color: Colors.white),
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
                          // top: BorderSide(width: 2, color: Colors.white),
                          left: BorderSide(color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 70,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text(
                          disagreeText,
                          style: const TextStyle(color: Colors.white),
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
