import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/presentation/user_screen/user_screen_event.dart';
import 'package:text_project/presentation/user_screen/user_screen_state.dart';
import 'package:text_project/presentation/common/image_handler.dart';
import 'package:http/http.dart' as http;

class UserScreenViewModel with ChangeNotifier {
  final FirebaseStorageRepo _storageRepo;
  final FirestoreRepo _storeRepo;
  UserScreenState _state = UserScreenState(
    user: null,
    userInformation: null,
    realPhoto: null,
    realName: null,
    edittedPhoto: null,
    edittedName: null,
    isLoading: false,
    isNameChanged: false,
    isPhotoChanged: false,
  );
  UserScreenState get state => _state;
  final StreamController<UserScreenEvent> _eventController =
      StreamController<UserScreenEvent>.broadcast();
  Stream<UserScreenEvent> get eventStream => _eventController.stream;
  UserScreenViewModel(
      {required FirebaseStorageRepo storageRepo,
      required FirestoreRepo storeRepo})
      : _storageRepo = storageRepo,
        _storeRepo = storeRepo;

  set edittedPhoto(Uint8List? value) {
    _state = _state.copyWith(edittedPhoto: value, isPhotoChanged: true);
    notifyListeners();
  }

  set edittedName(String? value) {
    _state = _state.copyWith(edittedName: value, isNameChanged: true);
    notifyListeners();
  }

  int get wins => _state.userInformation == null
      ? 0
      : _state.userInformation!.easyWinCount +
          _state.userInformation!.normalWinCount +
          _state.userInformation!.hardWinCount +
          _state.userInformation!.impossibleWinCount;

  int get losses => _state.userInformation == null
      ? 0
      : _state.userInformation!.gameCount - wins;

  Future<void> getUserInfo() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final userInformation = await _storeRepo.fetchUserInformation();
      if (user == null) return;
      _state = _state.copyWith(user: user, userInformation: userInformation);
      final photo = await _getUserPhoto();
      _state = _state.copyWith(
        realPhoto: photo,
        realName: user.displayName,
        edittedPhoto: photo,
        edittedName: user.displayName,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> saveChanges() async {
    try {
      _state = _state.copyWith(isLoading: true);
      notifyListeners();
      if (_state.isNameChanged &&
          _state.edittedName != null &&
          _state.edittedName!.length >= 2) {
        await _updateDisplayName(_state.edittedName!);
        _state = _state.copyWith(realName: _state.edittedName);
      }

      if (_state.isPhotoChanged) {
        if (_state.edittedPhoto == null) {
          await _deleteUserPhoto();
        } else {
          await _updateUserPhoto(_state.edittedPhoto!);
        }
        _state = _state.copyWith(realPhoto: _state.edittedPhoto);
      }

      _state = _state.copyWith(isPhotoChanged: false, isNameChanged: false);

      _eventController.sink.add(const UserScreenEvent.onSave());
    } on FirebaseException catch (err) {
      print(err);
      _eventController.sink.add(UserScreenEvent.onError(err.code));
    } catch (err) {
      print(err);
      _eventController.sink.add(UserScreenEvent.onError(err.toString()));
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> _updateUserPhoto(Uint8List photo) async {
    try {
      if (state.user == null) return;
      await _storageRepo.updateUserPhoto(photo);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: e.plugin,
          code: 'update-photo',
          message: 'Failed to update photo');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _deleteUserPhoto() async {
    try {
      await _storageRepo.deleteUserPhoto();
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: e.plugin,
          code: 'delete-photo',
          message: 'Failed to delete photo');
    } catch (e) {
      rethrow;
    }
  }

  //TODO: 중복이름 변경 방지하기.
  Future<void> _updateDisplayName(String name) async {
    try {
      if (state.user == null) return;

      if (await _storeRepo.checkNameExists(name)) {
        throw FirebaseException(
            plugin: 'firebase_auth',
            code: 'name-exists',
            message: '이미 사용');
      }
      await _storeRepo.updateDisplayName(name);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: e.plugin,
          code: 'update-name',
          message: 'Failed to update name');
    } catch (e) {
      rethrow;
    }
  }

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
    return null;
  }

  void onEditPressed() {
    _eventController.sink.add(const OnEditPressed());
  }

  // validate user display name.
  // user name should be at least 2 characters long and unique
  // check if the name is unique by checking the firebase
  // if the name is unique, return null
  // if the name is not unique, return error string message
  String? validateName(String? value) {
    if (value == null || value.length < 2) {
      return '별명은 2자 이상이어야 합니다.';
    }

    if (value.length > 10) {
      return '별명은 10자 이하여야 합니다.';
    }

    return null;
  }

  void onProfileTap() {
    _eventController.sink.add(const UserScreenEvent.onProfileTap());
  }

  void onVerifyEmailTap() {
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      _eventController.sink.add(const UserScreenEvent.onVerifyEmailTap(true));
    } else {
      _eventController.sink.add(const UserScreenEvent.onVerifyEmailTap(false));
    }
  }

  void onDeleteAccountTap() {
    _eventController.sink.add(const UserScreenEvent.onDeleteAccountTap());
  }

  Future<String?> verifyEmail() async {
    try {
      if (state.user == null) return null;
      await state.user!.sendEmailVerification();
      return state.user!.email!;
    } on FirebaseException catch (e) {
      _eventController.sink.add(UserScreenEvent.onError(e.code));
      return null;
    } catch (e) {
      _eventController.sink.add(UserScreenEvent.onError(e.toString()));
      return null;
    }
  }

  // 회원탈퇴하려면 비밀번호를 한번 더 입력해야함
  Future<String?> deleteUserAccount(String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: state.user!.email!,
          password: password,
        ),
      );

      userCredential.user!.delete();

      await state.user!.delete();

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return '비밀번호가 일치하지 않습니다.';
      } else {
        return '회원탈퇴에 실패했습니다.';
      }
    } catch (e) {
      return '회원탈퇴에 실패했습니다.';
    }
  }
}
