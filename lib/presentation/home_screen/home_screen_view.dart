import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

import 'package:text_project/di/provider_setting.dart';
import 'package:text_project/presentation/common/asking_dialog.dart';
import 'package:text_project/presentation/common/downloader.dart';
import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_mode.dart';
import 'package:text_project/presentation/initial_screen/initial_screen_view.dart';
import 'package:text_project/utils.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  StreamSubscription? _streamSubscription;

  //TODO: FIREBASE 앱 체크 토큰인가 뭔가 설정하고 DB 다운로드 받을 수 있게 하기
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        final viewModel = context.read<HomeScreenViewModel>();
        _streamSubscription = viewModel.eventStream.listen(
          (event) {
            event.when(
              onGameStartPressed: () async {
                // final directory = await getApplicationDocumentsDirectory();
                // final dbPath = path.join(directory.path, 'word.db');
                // File file = File(dbPath);
                // await file.delete();

                final dbExists = await checkWordDBExists();
                print(dbExists);
                if (true) {
                  final res = await showDialog<bool>(
                    context: context,
                    builder: (context) => const AskingDialog(
                      message: 'DB가 존재하지 않습니다.\n다운로드 받으시곘습니까?',
                      agreeText: '네',
                      disagreeText: '아니오',
                    ),
                  );

                  if (res == true) {
                    final client = http.Client();
                    await context
                        .read<HomeScreenViewModel>()
                        .downloadWordDB(client);

                    showDialog(
                      context: context,
                      builder: (context) => Consumer<HomeScreenViewModel>(
                        builder: (context, vm, child) {
                          if (vm.downloadDone) {
                            Navigator.pop(context);
                          }
                          return SimpleDialog(
                            children: [
                              LinearProgressIndicator(
                                value: vm.downloadProgress,
                              ),
                              TextButton(
                                onPressed: () {
                                  client.close();
                                  Navigator.pop(context);
                                },
                                child: Text('취소'),
                              )
                            ],
                          );
                        },
                      ),
                    );

                    // final dbRef = FirebaseStorage.instance.ref('word_db.db');
                    // final downloadUrl = await dbRef.getDownloadURL();
                    // double progressStatus = .0;
                    // final data = await HttpDownloader.download(
                    //   downloadUrl,
                    //   (total, downloaded, progress) {
                    //     progressStatus = progress;
                    //   },
                    // );
                    // final directory = await getApplicationDocumentsDirectory();
                    // final dbPath = path.join(directory.path, 'word.db');
                  } else {}

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
                        child: Text('네'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop<bool>(false);
                        },
                        child: Text('아니오'),
                      )
                    ],
                  ),
                );

                if (!mounted) return;

                if (res == true) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InitialScreenView(),
                  ));
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
                    icon: Icon(Icons.logout),
                  )
                ],
                accountName: Text('test'),
                accountEmail: Text('test@dot.com'),
                decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )))
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: viewModel.gameStart,
              child: const Text('Game Start'),
            ),
          ),
        ],
      ),
    );
  }
}



// TO-DO: 게임 시작 눌렀을 때 WORD DB 없으면 다운로드 받을지 물어보기
// 네 누르면 true 반환하고 다운로드 시작.
// Future<bool> askDownloadWordDB() async {}
