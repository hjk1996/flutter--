import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_screen_state.freezed.dart';

@freezed
class UserScreenState with _$UserScreenState {
  factory UserScreenState({required User? user}) = _UserScreenState;
}
