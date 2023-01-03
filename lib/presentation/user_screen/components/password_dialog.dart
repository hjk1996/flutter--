import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

class PasswordDialog extends StatefulWidget {
  const PasswordDialog({super.key});

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('비밀번호를 입력해주세요', textAlign: TextAlign.center),
      content: TextField(
        controller: _controller,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '비밀번호',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final res =
                await context.read<UserScreenViewModel>().deleteUserAccount(
                      _controller.text,
                    );
            if (!mounted) return;
            Navigator.of(context).pop(res);
          },
          child: const Text('확인'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('취소'),
        ),
      ],
    );
  }
}
