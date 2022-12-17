import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/feedback_screen/feedback_screen.dart';
import 'package:text_project/presentation/home_screen/components/game_rule_dialog.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:text_project/presentation/note_screen/note_screen_view.dart';
import 'package:text_project/presentation/user_screen/user_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Divider(),
          ListTile(
            style: ListTileStyle.drawer,
            shape: ListTileTheme.of(context).shape,
            leading: const Icon(Icons.person),
            title: Text(
              '마이 페이지',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              // drawer 닫기
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            style: ListTileStyle.drawer,
            shape: ListTileTheme.of(context).shape,
            leading: const Icon(Icons.abc),
            title: Text(
              '단어장',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              // drawer 닫기
              Navigator.pop(context);
              // 단어장으로 보내기
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteScreen(),
                  ));
            },
          ),
          const Divider(),
          ListTile(
            style: ListTileStyle.drawer,
            shape: ListTileTheme.of(context).shape,
            leading: const Icon(Icons.rule),
            title: Text(
              '게임 규칙',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const GameRuleDialog();
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            style: ListTileStyle.drawer,
            shape: ListTileTheme.of(context).shape,
            leading: const Icon(Icons.message),
            title: Text(
              '의견 보내기',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedbackScreen(),
                  ));
            },
          ),
          const Divider(),
          ListTile(
            style: ListTileStyle.drawer,
            shape: ListTileTheme.of(context).shape,
            leading: const Icon(Icons.exit_to_app),
            title: Text(
              '로그아웃',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: context.read<HomeScreenViewModel>().onLogOutPressed,
          ),
          const Divider(),
        ],
      ),
    );
  }
}