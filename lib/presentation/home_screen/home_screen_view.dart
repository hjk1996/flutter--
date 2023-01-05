import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';

import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/home_screen/components/drawer.dart';
import 'package:text_project/presentation/home_screen/components/game_menu.dart';
import 'package:text_project/presentation/home_screen/components/rank_board_page_view.dart';
import 'package:text_project/presentation/home_screen/home_screen_event.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late StreamSubscription<HomeScreenEvent> _streamSubscription;

  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        // auth page로 나갈 때 initState가 call 되는 문제가 발생함.

        final viewModel = context.read<HomeScreenViewModel>();
        _streamSubscription = viewModel.eventStream.listen(
          (event) {
            event.when(
              onError: (message) {},
              onGameStart: () async {
                if (!mounted) return;
                await FirebaseAuth.instance.currentUser!.reload();
                if (!FirebaseAuth.instance.currentUser!.emailVerified) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "이메일 인증이 필요합니다.\n인증 후 이용해주세요.",
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("확인"),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }
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
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "게임",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 10),
              const GameMenu(),
              const SizedBox(height: 20),
              Text(
                "랭킹",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 10),
              const RankBoardPageView(),
              const SizedBox(height: 10),
            ],
          ),
        ),
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
