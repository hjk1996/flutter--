import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';

class GameMenu extends StatefulWidget {
  const GameMenu({super.key});

  @override
  State<GameMenu> createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          children: [
            GameMenuCard(
              assetPath: 'assets/images/home_screen/ai_game.png',
              onTap: context.read<HomeScreenViewModel>().onGameStart,
            ),
            GameMenuCard(
              assetPath: 'assets/images/home_screen/pvp_game.png',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "준비중입니다.",
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
              },
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 60,
              height: 30,
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Text("${_currentPage + 1}/2"),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Center(child: Builder(builder: (context) {
            if (_currentPage == 0) {
              return Text(
                'AI와 대결하기',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
              );
            } else {
              return Text(
                '사람과 대결하기',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
              );
            }
          })),
        ),
      ]),
    );
  }
}

class GameMenuCard extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  const GameMenuCard({super.key, required this.assetPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.fitWidth,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
