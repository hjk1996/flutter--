import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'user_screen_state.freezed.dart';

@freezed
class UserScreenState with _$UserScreenState {
  factory UserScreenState({required User? user, required Uint8List? profileImage}) = _UserScreenState;
}
