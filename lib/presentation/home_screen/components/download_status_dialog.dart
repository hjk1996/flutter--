import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/di/provider_setting.dart';
import 'package:text_project/presentation/common/asking_dialog.dart';
import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_mode.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DownloadStatusDialog extends StatefulWidget {
  const DownloadStatusDialog({super.key});

  @override
  State<DownloadStatusDialog> createState() => _DownloadStatusDialogState();
}

class _DownloadStatusDialogState extends State<DownloadStatusDialog> {
  final client = http.Client();

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  void onCancelPressed() {
    context.read<HomeScreenViewModel>().cancelToken!.cancel();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeScreenViewModel>();
    viewModel.downloadWordDB(client);
    return SimpleDialog(
      children: [
        Consumer<HomeScreenViewModel>(
          builder: (context, vm, child) {
            return vm.downloadDone
                ? const Text('다운로드 완료')
                : LinearProgressIndicator(
                    value: vm.downloadProgress,
                  );
          },
        ),
        Consumer<HomeScreenViewModel>(
          builder: (context, vm, child) {
            return vm.downloadDone
                ? TextButton(
                    onPressed: () async {
                      await vm.goToGameScreen(context);
                    },
                    child: const Text('확인'),
                  )
                : TextButton(
                    onPressed: onCancelPressed,
                    child: const Text('취소'),
                  );
          },
        ),
      ],
    );
  }
}
