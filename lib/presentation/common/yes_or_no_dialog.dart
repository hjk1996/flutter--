import 'package:flutter/material.dart';

Future<bool?> askYesOrNo(
    {required BuildContext context,
    required String content,
    bool cancelDialog = false}) async {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('네')),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('아니오'),
            ),
            if (cancelDialog)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('취소'),
              )
          ],
        );
      });
}
