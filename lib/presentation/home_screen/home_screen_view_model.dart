import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_project/presentation/home_screen/home_screen_event.dart';

class HomeScreenViewModel with ChangeNotifier {
  final StreamController<HomeScreenEvent> _eventController =
      StreamController<HomeScreenEvent>.broadcast();
  Stream<HomeScreenEvent> get eventStream => _eventController.stream;
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void onLogOutPressed() {
    _eventController.sink.add(
      const HomeScreenEvent.onLogoutPressed(),
    );
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> onGameStart() async {
    _eventController.sink.add(const HomeScreenEvent.onGameStart());
  }
}
