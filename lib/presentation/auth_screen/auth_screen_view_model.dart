import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future onAuthButtonClick() async => state.isSignIn ? _signIn() : _signUp();

  // TODO: signIn과 signUp 메소드 구현하기
  Future _signIn() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: state.email, password: state.password);
    } on FirebaseAuthException catch (error) {
      
    }
  }

  Future _signUp() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: state.email, password: state.password);
    } on FirebaseAuthException catch (error) {}
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
    // setValidationState();
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
    // setValidationState();
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
    // setValidationState();
  }
}
