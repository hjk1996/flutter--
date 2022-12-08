import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';

import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/home_screen/components/drawer.dart';
import 'package:text_project/presentation/home_screen/components/game_menu.dart';
import 'package:text_project/presentation/home_screen/home_screen_event.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:text_project/presentation/initial_screen/initial_screen_view.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  StreamSubscription<HomeScreenEvent>? _streamSubscription;

  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        // auth page로 나갈 때 initState가 call 되는 문제가 발생함.

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
                final res =
                    await askYesOrNo(context: context, content: "로그아웃 하시겠습니까?");
                // eventStream이 중복으로 구독되는 문제 해결해야함
                if (res == true) {
                  await viewModel.logout();
                  if (!mounted) return;
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AuthScreenView(),
                    ),
                  );
                }
              },
            );
          },
        );

        // // TODO: 이벤트 스트림이 중복으로 구독되는 문제 해결해야함
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose');
    _streamSubscription!.cancel();
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
