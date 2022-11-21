import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';

class GameScreenAppBar extends StatefulWidget with PreferredSizeWidget {
  const GameScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<GameScreenAppBar> createState() => _GameScreenAppBarState();
}

class _GameScreenAppBarState extends State<GameScreenAppBar> {
  void _unfocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameScreenViewModel>();
    return AppBar(
      leading: IconButton(
        onPressed: () async {
          _unfocus();
          final answer = await askYesOrNo(context, '게임에서 나가겠습니까?');
          if (answer == true && mounted) {
            viewModel.endGame();
             Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.exit_to_app),
      ),
      title: null,
      actions: [
        viewModel.state.isPlaying
            ? IconButton(
                onPressed: () async {
                  _unfocus();
                  var answer = await askYesOrNo(context, '게임을 다시 하겠습니까?');
                  if (answer == null || answer == false || !mounted) return;
                  answer = await askYesOrNo(context, '먼저 공격하시겠습니까?');
                  if (answer != null) {
                    viewModel.startGame(answer);
                  }
                },
                icon: const Icon(Icons.restart_alt),
              )
            : IconButton(
                onPressed: () async {
                  _unfocus();
                  final answer = await askYesOrNo(context, '먼저 공격하시겠습니까?');
                  if (answer != null) {
                    viewModel.startGame(answer);
                  }
                },
                icon: const Icon(Icons.play_arrow),
              )
      ],
    );
  }
}

class GameResetIconButton extends StatelessWidget {
  const GameResetIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
