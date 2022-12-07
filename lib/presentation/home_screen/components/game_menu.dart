import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameMenuCard(
              content: 'AI',
              onTap: context.read<HomeScreenViewModel>().onGameStart),
          GameMenuCard(content: 'PvP', onTap: () {})
        ],
      ),
    );
  }
}

class GameMenuCard extends StatelessWidget {
  final String content;
  final VoidCallback onTap;
  const GameMenuCard({super.key, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Center(
              child: Text(
                content,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
