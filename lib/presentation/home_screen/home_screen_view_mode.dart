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
  final StreamController<HomeScreenEvent> _eventController = StreamController();
  Stream<HomeScreenEvent> get eventStream => _eventController.stream;

  Future<void> logout() async {
    _eventController.sink.add(
      const HomeScreenEvent.onLogoutPressed(),
    );
  }

  Future<void> onGameStart() async {
    _eventController.sink.add(const HomeScreenEvent.onGameStart());
  }
}
