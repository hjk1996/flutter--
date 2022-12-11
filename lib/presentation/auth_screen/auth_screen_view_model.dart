import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_event.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_state.dart';

class AuthScreenViewModel with ChangeNotifier {
  AuthScreenState _state = AuthScreenState(
      isSignIn: true,
      email: '',
      password: '',
      confirmPassword: '',
      isValidEmail: false,
      isValidPassword: false,
      isValidConfirmPassword: false);
  AuthScreenState get state => _state;

  final _eventController = StreamController<AuthScreenEvent>.broadcast();
  Stream<AuthScreenEvent> get eventStream => _eventController.stream;

  void toggleAuthMode() {
    _state = _state.copyWith(
      isSignIn: !_state.isSignIn,
      email: '',
      password: '',
      confirmPassword: '',
      isValidEmail: false,
      isValidPassword: false,
      isValidConfirmPassword: false,
    );
    notifyListeners();
  }

  set setEmail(String value) {
    _state = _state.copyWith(email: value);
    notifyListeners();
  }

  set setPassword(String value) {
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  set setConfirmPassword(String value) {
    _state = _state.copyWith(confirmPassword: value);
    notifyListeners();
  }

  Future<void> onAuthButtonClick() async =>
      state.isSignIn ? _signIn() : _signUp();

  Future<void> _signIn() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: state.email, password: state.password);

      _eventController.sink.add(const AuthScreenEvent.onSignInSuccess());
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('잘못된 이메일입니다.'));
          break;
        case 'user-disabled':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('비활성화된 유저입니다.'));
          break;
        case 'user-not-found':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('유저를 찾지 못했습니다.'));
          break;
        case 'wrong-password':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('잘못된 비밀번호입니다.'));
          break;
        case 'too-many-requests':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('나중에 다시 시도해주세요.'));
          break;

        default:
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('알 수 없는 에러가 발생했습니다.'));
          break;
      }
    }
  }

  // sign up with email and password. send the validation email to the user email.
  signUp() async {}

  Future<void> _signUp() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: state.email, password: state.password);

      await userCredential.user!.sendEmailVerification();
      _eventController.sink.add(const AuthScreenEvent.onSignUpSuccess());
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('이미 사용중인 이메일입니다.'));
          break;
        case 'invalid-email':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('올바르지않은 이메일입니다.'));
          break;
        case 'operation-not-allowed':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('허용되지 않은 작업입니다.'));
          break;
        case 'weak-password':
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('좀 더 강한 비밀번호를 설정하세요.'));
          break;
        default:
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('알 수 없는 에러가 발생했습니다.'));
          break;
      }
    }
  }

  bool get isValid => state.isSignIn
      ? state.isValidEmail && state.isValidPassword
      : state.isValidEmail &&
          state.isValidPassword &&
          state.isValidConfirmPassword;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      _state = _state.copyWith(isValidEmail: false);

      return '이메일 주소를 입력해주세요.';
    }

    final isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!isValidEmail) {
      _state = _state.copyWith(isValidEmail: false);

      return '이메일 형식이 올바르지 않습니다';
    }

    _state = _state.copyWith(isValidEmail: true);
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      _state = _state.copyWith(isValidPassword: false);

      return '비밀번호를 입력해주세요.';
    }

    if (value.length < 8) {
      _state = _state.copyWith(isValidPassword: false);
      return '8자 이상으로 비밀번호를 설정해주세요.';
    }

    _state = _state.copyWith(isValidPassword: true);
    return null;
  }

  String? validateConfirmPassword(String? value) {
    // print(value);
    // print(state.password);
    // print(state.confirmPassword);
    // print(state.confirmPassword == value);

    if (value == null || value.isEmpty) {
      _state = _state.copyWith(isValidConfirmPassword: false);
      return '비밀번호를 다시 입력해주세요.';
    }

    if (value != state.confirmPassword) {
      _state = _state.copyWith(isValidConfirmPassword: false);
      return '비밀번호가 일치하지 않습니다.';
    }

    _state = _state.copyWith(isValidConfirmPassword: true);
    return null;
  }
}
