import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_project/presentation/common/downloader.dart';
import 'package:text_project/presentation/home_screen/home_screen_event.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class HomeScreenViewModel with ChangeNotifier {
  bool _downloadDone = false;
  bool get downloadDone => _downloadDone;
  double _downloadProgress = .0;
  double get downloadProgress => _downloadProgress;

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

  Future<void> downloadWordDB(http.Client client) async {
    final dbRef = FirebaseStorage.instance.ref('word_db.db');
    final downloadUrl = await dbRef.getDownloadURL();
    _downloadProgress = .0;
    _downloadDone = false;
    final data = await HttpDownloader.download(
      downloadUrl,
      client,
      (total, downloaded, progress) {
        _downloadProgress = progress;
        notifyListeners();
      },
    );
    _downloadDone = true;
    notifyListeners();
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = path.join(directory.path, 'word.db');
    File file = File(dbPath);
    await file.writeAsBytes(data);
  }
}
