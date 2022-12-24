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
              content: 'AI',
              onTap: context.read<HomeScreenViewModel>().onGameStart,
            ),
            GameMenuCard(
              content: 'PvP',
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
        )
      ]),
    );
  }
}

class GameMenuCard extends StatelessWidget {
  final String content;
  final VoidCallback onTap;
  const GameMenuCard({super.key, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            content,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
