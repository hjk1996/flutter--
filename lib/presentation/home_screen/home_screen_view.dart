import 'package:flutter/material.dart';
import 'package:text_project/presentation/game_screen/game_screen_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreenView(),
                      ));
                },
                child: const Text('Game Start')),
          ),
        ],
      ),
    );
  }
}
