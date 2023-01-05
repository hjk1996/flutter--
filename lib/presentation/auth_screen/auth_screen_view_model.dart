import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_event.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_state.dart';

class AuthScreenViewModel with ChangeNotifier {
  final FirestoreRepo _storeRepo;
  final FirebaseStorageRepo _storageRepo;
  AuthScreenViewModel(
      {required FirestoreRepo storeRepo,
      required FirebaseStorageRepo storageRepo})
      : _storeRepo = storeRepo,
        _storageRepo = storageRepo;

  AuthScreenState _state = AuthScreenState(
    isSignIn: true,
    email: '',
    password: '',
    confirmPassword: '',
    name: '',
    image: null,
    isLoading: false,
    isValidEmail: false,
    isValidPassword: false,
    isValidConfirmPassword: false,
    isValidName: false,
  );
  AuthScreenState get state => _state;

  final _eventController = StreamController<AuthScreenEvent>.broadcast();
  Stream<AuthScreenEvent> get eventStream => _eventController.stream;

  void toggleAuthMode() {
    _state = _state.copyWith(
      isSignIn: !_state.isSignIn,
      email: '',
      password: '',
      confirmPassword: '',
      name: '',
      image: null,
      isLoading: false,
      isValidEmail: false,
      isValidPassword: false,
      isValidConfirmPassword: false,
    );
    notifyListeners();
  }

  set email(String value) {
    _state = _state.copyWith(email: value);
    notifyListeners();
  }

  set name(String value) {
    _state = _state.copyWith(name: value);
    notifyListeners();
  }

  set password(String value) {
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  set confirmPassword(String value) {
    _state = _state.copyWith(confirmPassword: value);
    notifyListeners();
  }

  set image(Uint8List? value) {
    _state = _state.copyWith(image: value);
    notifyListeners();
  }

  Future<void> onAuthButtonClick() async =>
      state.isSignIn ? _signIn() : _signUp();

  Future<void> _signIn() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: state.email, password: state.password);

      _state = _state.copyWith(
        email: '',
        password: '',
        confirmPassword: '',
        name: '',
        image: null,
        isValidEmail: false,
        isValidPassword: false,
        isValidConfirmPassword: false,
        isValidName: false,
      );

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
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> _signUp() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    try {
      final nameExists = await _storeRepo.checkNameExists(state.name);

      if (nameExists) {
        _eventController.sink
            .add(const AuthScreenEvent.onAuthError('이미 사용중인 이름입니다.'));
        return;
      }

      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      final user = userCredential.user!;
      await user.updateDisplayName(state.name);
      await _storeRepo.updateDisplayName(state.name);
      await user.sendEmailVerification();
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
              .add(const AuthScreenEvent.onAuthError('좀 더 강한 비밀번호를 입력해주세요.'));
          break;
        default:
          _eventController.sink
              .add(const AuthScreenEvent.onAuthError('알 수 없는 에러가 발생했습니다.'));
          break;
      }
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  void skipProfileImage() {
    _state = _state.copyWith(image: null);
    _eventController.sink.add(const AuthScreenEvent.onProfileSettingDone());
  }

  Future<void> updateUserPhoto() async {
    try {
      await _storageRepo.updateUserPhoto(state.image!);
      _state = _state.copyWith(image: null);
      _eventController.sink.add(const AuthScreenEvent.onProfileSettingDone());
    } on FirebaseException catch (e) {
      _eventController.sink.add(
        const AuthScreenEvent.onAuthError('프로필 사진 설정에 실패했습니다.'),
      );
    } catch (e) {
      rethrow;
    }
  }

  void onProfileTap() {
    _eventController.sink.add(const AuthScreenEvent.onProfileTap());
  }

  bool get isValid => state.isSignIn
      ? state.isValidEmail && state.isValidPassword
      : state.isValidEmail &&
          state.isValidPassword &&
          state.isValidConfirmPassword &&
          state.isValidName;

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

    if (!value.endsWith('@naver.com')) {
      _state = _state.copyWith(isValidEmail: false);

      return '네이버 이메일만 사용 가능합니다.';
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

    if (value != state.password) {
      _state = _state.copyWith(isValidConfirmPassword: false);
      return '비밀번호가 일치하지 않습니다.';
    }

    _state = _state.copyWith(isValidConfirmPassword: true);
    return null;
  }

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      _state = _state.copyWith(isValidName: false);

      return '닉네임을 입력해주세요.';
    }

    if (name.length < 2) {
      _state = _state.copyWith(isValidName: false);

      return '2자 이상으로 닉네임을 설정해주세요.';
    }

    if (name.length > 10) {
      _state = _state.copyWith(isValidName: false);

      return '10자 이하로 닉네임을 설정해주세요.';
    }

    _state = _state.copyWith(isValidName: true);

    return null;
  }
}
