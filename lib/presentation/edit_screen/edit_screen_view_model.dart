import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_project/presentation/edit_screen/edit_screen_event.dart';
import 'package:text_project/presentation/edit_screen/edit_screen_state.dart';
import 'package:text_project/presentation/user_screen/user_screen_state.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

class EditScreenViewModel with ChangeNotifier {
  UserScreenViewModel _uvm;
  UserScreenViewModel get uvm => _uvm;

  EditScreenState _state;
  EditScreenState get state => _state;
  EditScreenViewModel({required UserScreenViewModel uvm})
      : _uvm = uvm,
        _state = EditScreenState(
            isNameChange: false,
            isPhotoChange: false,
            isLoading: false,
            name: uvm.state.user?.displayName,
            photo: uvm.state.profileImage);

  final StreamController<EditScreenEvent> _eventController =
      StreamController<EditScreenEvent>.broadcast();
  Stream<EditScreenEvent> get eventStream => _eventController.stream;

  set name(String? value) {
    _state = _state.copyWith(name: value, isNameChange: true);
  }

  set photo(Uint8List? value) {
    _state = _state.copyWith(photo: value, isPhotoChange: true);
    notifyListeners();
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

    return null;
  }

  Future<void> _saveDisplayName() async {
    if (_state.name == null) return;
    if (_state.name!.length < 2) return;
    if (_state.isNameChange) await _uvm.saveChanges(name: _state.name);
  }

  Future<void> _savePhoto() async {
    if (!_state.isPhotoChange) return;
    await _uvm.saveChanges(photo: _state.photo);
  }

  Future<void> save() async {
    if (_uvm.state.user == null) return;

    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      await _saveDisplayName();
      await _savePhoto();
      await _uvm.getUserInfo();
      _state = _state.copyWith(isNameChange: false, isPhotoChange: false);
      _eventController.sink.add(const EditScreenEvent.onSave());
    } catch (e) {
      _eventController.sink.add(EditScreenEvent.onError(e.toString()));
    } finally {
      _state = _state.copyWith(isLoading: false);
    }
  }

  void onProfileTap() {
    _eventController.sink.add(const EditScreenEvent.onProfileTap());
  }
}
