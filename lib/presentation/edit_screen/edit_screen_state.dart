import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_screen_state.freezed.dart';

@freezed
class EditScreenState with _$EditScreenState {
  factory EditScreenState(
      {required bool isNameChange,
      required bool isPhotoChange,
      required bool isLoading,
      required String? name,
      required Uint8List? photo}) = _EditScreenState;
}
