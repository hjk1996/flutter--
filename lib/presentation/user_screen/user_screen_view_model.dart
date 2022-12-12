import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/presentation/user_screen/user_screen_event.dart';
import 'package:text_project/presentation/user_screen/user_screen_state.dart';

class UserScreenViewModel with ChangeNotifier {
  final FirebaseStorageRepo _repo;
  UserScreenState _state = UserScreenState(user: null);
  UserScreenState get state => _state;
  StreamController<UserScreenEvent> _eventController =
      StreamController<UserScreenEvent>.broadcast();
  Stream<UserScreenEvent> get eventStream => _eventController.stream;
  UserScreenViewModel({required FirebaseStorageRepo repo}) : _repo = repo;

  Future<void> getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _state = _state.copyWith(
        user: user,
      );
    }
  }

  Future<void> saveChanges(String name) async {
    _updateDisplayName(name);
    _updatePhoto();
    notifyListeners();
  }

  Future<void> _updateDisplayName(String name) async {
    if (state.user == null) return;
    await state.user!.updateDisplayName(name);
  }

  Future<void> _updatePhoto() async {
    if (state.user == null) return;
  }

  // URL 이용해서 프로필 이미지 받아오기
  //download image file from url using http request
  Future<void> downloadImageFile() async {
    if (state.user == null) return;
    final url = state.user!.photoURL;
    if (url == null) return;
  }

  void onEditPressed() {
    _eventController.sink.add(OnEditPressed());
  }
}
