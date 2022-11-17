import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';

class GameScreenAppBar extends StatefulWidget with PreferredSizeWidget {
  const GameScreenAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<GameScreenAppBar> createState() => _GameScreenAppBarState();
}

class _GameScreenAppBarState extends State<GameScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameScreenViewModel>();
    return AppBar(
      leading: IconButton(
        onPressed: () async {
          final answer = await askYesOrNo(context, '게임에서 나가겠습니까?');
          if (answer == true && mounted) {
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.exit_to_app),
      ),
      title: viewModel.state.lastWord != null
          ? Text(viewModel.state.lastWord!)
          : null,
      actions: [
        viewModel.state.isGameFinished
            ? IconButton(
                onPressed: () async {
                  final answer = await askYesOrNo(context, '게임을 다시 하겠습니까?');
                  if (answer == true) {
                    viewModel.resetState();
                  }
                },
                icon: const Icon(Icons.restart_alt))
            : IconButton(
                onPressed: () async {
                  final answer = await askYesOrNo(context, '누가 먼저 하겠습니까?');
                  if (answer == true) {
                    
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
