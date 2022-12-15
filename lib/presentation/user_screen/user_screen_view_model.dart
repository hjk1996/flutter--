import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/presentation/user_screen/user_screen_event.dart';
import 'package:text_project/presentation/user_screen/user_screen_state.dart';
import 'package:http/http.dart' as http;

class UserScreenViewModel with ChangeNotifier {
  final FirebaseStorageRepo _repo;
  UserScreenState _state = UserScreenState(user: null, profileImage: null);
  UserScreenState get state => _state;
  StreamController<UserScreenEvent> _eventController =
      StreamController<UserScreenEvent>.broadcast();
  Stream<UserScreenEvent> get eventStream => _eventController.stream;
  UserScreenViewModel({required FirebaseStorageRepo repo}) : _repo = repo;

  Future<void> getUserInfo() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      _state = _state.copyWith(user: user);
      final photo = await _getUserPhoto();
      _state = _state.copyWith(
        profileImage: photo,
      );
    } catch (e) {
      print("failed to get user info");
      print(e);
    }
  }

  Future<void> saveChanges({String? name, Uint8List? photo}) async {
    if (name != null) await _updateDisplayName(name);
    if (photo == null) {
      await _deleteUserPhoto();
    } else {
      await _updateUserPhoto(photo);
    }
    notifyListeners();
  }

  Future<void> _updateUserPhoto(Uint8List photo) async {
    try {
      if (state.user == null) return;
      final path = "users/${state.user!.uid}/profile.jpg";
      final file = await _convertUint8ListToFile(photo);
      final url = await _repo.uploadFile(path, file);
      await state.user!.updatePhotoURL(url);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: e.plugin,
          code: 'update-photo',
          message: 'Failed to update photo');
    } catch (e) {
      rethrow;
    }
  }

  // uint8list to file
  Future<File> _convertUint8ListToFile(Uint8List image) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final file = File('$path/image.jpg');
    await file.writeAsBytes(image);
    return file;
  }

  Future<void> _deleteUserPhoto() async {
    try {
      if (state.user == null) return;
      final path = "users/${state.user!.uid}/profile.jpg";
      await _repo.deleteFile(path);
      await state.user!.updatePhotoURL(null);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: e.plugin,
          code: 'delete-photo',
          message: 'Failed to delete photo');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _updateDisplayName(String name) async {
    try {
      if (state.user == null) return;
      await state.user!.updateDisplayName(name);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: e.plugin,
          code: 'update-name',
          message: 'Failed to update name');
    } catch (e) {
      rethrow;
    }
  }

  // TODO: 반환하는 파일을 File이 아니라 Image로 바꾸기
  //get user photo
  Future<Uint8List?> _getUserPhoto() async {
    try {
      if (state.user == null) return null;
      final url = state.user!.photoURL;
      if (url == null) return null;
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        // byte array to image
        return res.bodyBytes;
      }
    } catch (e) {
      print("failed to update photo");
      print(e);
    }
  }

  void onEditPressed() {
    _eventController.sink.add(const OnEditPressed());
  }
}
