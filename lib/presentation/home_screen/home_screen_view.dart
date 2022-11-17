import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:text_project/di/provider_setting.dart';

import 'package:text_project/presentation/common/asking_dialog.dart';
import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/home_screen/components/game_menu_card.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_mode.dart';
import 'package:text_project/presentation/initial_screen/initial_screen_view.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        final viewModel = context.read<HomeScreenViewModel>();
        _streamSubscription = viewModel.eventStream.listen(
          (event) {
            event.when(
              onGameStart: () async {
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangeNotifierProvider<GameScreenViewModel>(
                        create: (context) => makeGameScreenViewModel(),
                        child: const GameScreenView(),
                      );
                    },
                  ),
                );
              },
              onLogoutPressed: () async {
                final res = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('로그아웃 하시겠습니까?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pop<bool>(true);
                        },
                        child: const Text('네'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop<bool>(false);
                        },
                        child: const Text('아니오'),
                      )
                    ],
                  ),
                );

                if (res == true) {
                  if (!mounted) return;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InitialScreenView(),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeScreenViewModel>();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: const Icon(Icons.person),
              ),
              otherAccountsPictures: [
                IconButton(
                  onPressed: viewModel.logout,
                  icon: const Icon(Icons.logout),
                )
              ],
              accountName: const Text('test'),
              accountEmail: const Text('test@dot.com'),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameMenuCard(content: 'AI와 플레이', onTap: viewModel.onGameStart),
          GameMenuCard(content: '사람과 플레이', onTap: () {})
        ],
      ),
    );
  }
}
