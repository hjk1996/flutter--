import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:text_project/di/provider_setting.dart';
import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/home_screen/home_screen_event.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class HomeScreenViewModel with ChangeNotifier {
  bool _downloadDone = false;
  bool get downloadDone => _downloadDone;
  double _downloadProgress = .0;
  double get downloadProgress => _downloadProgress;
  CancelToken? _cancelToken;
  CancelToken? get cancelToken => _cancelToken;

  final StreamController<HomeScreenEvent> _eventController = StreamController();
  Stream<HomeScreenEvent> get eventStream => _eventController.stream;

  void gameStart() {
    _eventController.sink.add(
      const HomeScreenEvent.onGameStartPressed(),
    );
  }

  Future<void> logout() async {
    _eventController.sink.add(
      const HomeScreenEvent.onLogoutPressed(),
    );
  }

  Future<void> goToGameScreen(BuildContext context) async {
    return makeGameScreenViewModel().then(
      (vm) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider(
                create: (context) => vm,
                child: const GameScreenView(),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> downloadWordDB(http.Client client) async {
    final dbRef = FirebaseStorage.instance.ref('word_db.db');
    final downloadUrl = await dbRef.getDownloadURL();

    final directory = await getApplicationDocumentsDirectory();
    final dbPath = path.join(directory.path, 'word.db');

    _downloadProgress = .0;
    _downloadDone = false;
    final appCheckToken = await FirebaseAppCheck.instance.getToken();

    if (appCheckToken == null) {
      _eventController.sink.add(
        const HomeScreenEvent.onDownloadError('앱 토큰이 존재하지 않습니다.'),
      );
      return;
    }

    _cancelToken = CancelToken();

    try {
      await Dio(BaseOptions()).download(
        downloadUrl,
        dbPath,
        options: Options(headers: {"X-Firebase-AppCheck": appCheckToken}),
        cancelToken: cancelToken,
        onReceiveProgress: (count, total) {
          _downloadProgress = (count / total);
          print(_downloadProgress);

          if (_downloadProgress == 1.0) {
            _downloadDone = true;
          }
          notifyListeners();
        },
      );
    } on DioError catch (error) {
      DioErrorType;
      _eventController.sink.add(
        const HomeScreenEvent.onDownloadError('다운로드중 에러가 발생했습니다.'),
      );
    } finally {
      _cancelToken = null;
    }
  }
}
