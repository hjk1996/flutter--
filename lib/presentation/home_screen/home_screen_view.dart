import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_project/di/provider_setting.dart';
import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:text_project/utils.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  final dbExists = await checkWordDBExists();

                  if (!dbExists) {
                    return;
                  }

                  final viewModel = await makeGameScreenViewModel();
                  if (!mounted) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangeNotifierProvider(
                          create: (context) => viewModel,
                          child: const GameScreenView(),
                        );
                      },
                    ),
                  );
                },
                child: const Text('Game Start')),
          ),
        ],
      ),
    );
  }
}


// TO-DO: 게임 시작 눌렀을 때 WORD DB 없으면 다운로드 받을지 물어보기
// 네 누르면 true 반환하고 다운로드 시작.
// Future<bool> askDownloadWordDB() async {}
