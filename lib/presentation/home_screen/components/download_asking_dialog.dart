import 'package:flutter/material.dart';

class DownloadAskingDialog extends StatelessWidget {
  const DownloadAskingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        '단어 DB가 존재하지 않습니다.\n다운로드 받으시겠습니까?',
        textAlign: TextAlign.center,
      ),
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
            child: const Text('아니오')),
      ],
    );
  }
}
