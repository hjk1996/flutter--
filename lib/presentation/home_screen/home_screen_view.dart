import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/home_screen/components/drawer.dart';
import 'package:text_project/presentation/home_screen/components/game_menu.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:text_project/presentation/initial_screen/initial_screen_view.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  StreamSubscription? _streamSubscription;

  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        final viewModel = context.read<HomeScreenViewModel>();
        _streamSubscription ??= viewModel.eventStream.listen(
          (event) {
            event.when(
              onGameStart: () async {
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreenView(),
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
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeScreenViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      drawer: const HomeDrawer(),
      body: Consumer<HomeScreenViewModel>(
        builder: (context, vm, child) {
          return PageView(
            controller: vm.pageController,
            onPageChanged: vm.changePage,
            children: const [
              GameMenu(),
              RankPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<HomeScreenViewModel>(
        builder: (context, vm, child) {
          return BottomNavigationBar(
            currentIndex: vm.pageIndex,
            onTap: viewModel.pageController.jumpToPage,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.gamepad),
                label: '게임하기',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.workspace_premium_rounded),
                label: '랭킹보기',
              ),
            ],
          );
        },
      ),
    );
  }
}

class RankPage extends StatelessWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Container()],
    );
  }
}
