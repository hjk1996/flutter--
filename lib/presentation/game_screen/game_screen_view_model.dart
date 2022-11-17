import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/ai_player.dart';
import 'package:text_project/presentation/game_screen/game_screen_event.dart';
import 'package:text_project/presentation/game_screen/game_screen_state.dart';

class GameScreenViewModel with ChangeNotifier {
  final AIPlayer _aiPlayer;
  GameScreenViewModel({required AIPlayer aiPlayer}) : _aiPlayer = aiPlayer;

  GameScreenState _state =
      GameScreenState(messages: [], isLoading: false, isGameFinished: false);
  GameScreenState get state => _state;

  Timer? timer;

  final watch = Stopwatch();
  final _eventController = StreamController<GameScreenEvent>();
  Stream<GameScreenEvent> get eventStream => _eventController.stream;

  void setTimer() {
    timer = Timer(const Duration(seconds: 5), () {});
  }

  Future<void> sendMessage(String word) async {
    bool isFinished = false;

    isFinished = _wordValidation(word);
    if (isFinished) return;

    await _calculateNextMove(word);
  }

  void _updateMessage(
      {required String id,
      required String message,
      required bool isErrorMessage,
      bool updateLastWord = false,
      bool isLoading = false}) {
    _state = _state.copyWith(
      messages: [
        Message(
            id: id,
            content: message,
            createdAt: DateTime.now().microsecondsSinceEpoch,
            isErrorMessage: isErrorMessage),
        ..._state.messages
      ],
      isLoading: isLoading,
      lastWord: updateLastWord ? message : _state.lastWord,
    );
  }

  bool _wordValidation(String word) {
    final errorMessage = _validateWord(word);

    if (errorMessage == null) {
      _updateMessage(
          id: FirebaseAuth.instance.currentUser!.uid,
          message: word,
          isErrorMessage: false,
          updateLastWord: false);
      notifyListeners();
      return false;
    } else {
      _updateMessage(
          id: FirebaseAuth.instance.currentUser!.uid,
          message: word,
          isErrorMessage: false,
          updateLastWord: false);
      _updateMessage(
          id: _aiPlayer.id,
          message: errorMessage,
          isErrorMessage: true,
          updateLastWord: false);
      notifyListeners();
      return true;
    }
  }

  void _whenPlaying(NextMove nextMove) {
    _updateMessage(
        id: _aiPlayer.id,
        message: nextMove.word,
        isErrorMessage: false,
        updateLastWord: true);
  }

  void _whenPlayerWin(NextMove nextMove) {
    _state = _state.copyWith(
      isGameFinished: true,
      isLoading: false,
    );
    _eventController.add(const GameScreenEvent.onPlayerWin());
  }

  void _whenWordError(NextMove nextMove) {
    _updateMessage(
        id: _aiPlayer.id,
        message: nextMove.word,
        isErrorMessage: true,
        updateLastWord: false);
  }

  void _whenError(NextMove nextMove) {
    _state = _state.copyWith(isLoading: false);
    _eventController.add(GameScreenEvent.onError(nextMove.word));
  }

  Future<void> _calculateNextMove(String word) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    final NextMove nextMove = await _aiPlayer.calculateNextMove(word);
    switch (nextMove.gameStatus) {
      case GameStatus.playing:
        _whenPlaying(nextMove);
        break;
      case GameStatus.playerWin:
        _whenPlayerWin(nextMove);
        break;
      case GameStatus.wordError:
        _whenWordError(nextMove);
        break;
      case GameStatus.error:
        _whenError(nextMove);
        break;
      default:
    }
    notifyListeners();
  }

  Future<void> startGame() async {
    await _aiPlayer.initGame();
  }

  String? _validateWord(String? word) {
    if (word == null || word.isEmpty) {
      return "단어를 입력하세요";
    }

    if (word.length != 3) {
      return "세글자인 단어만 입력할 수 있습니다";
    }

    return null;
  }

  void resetState() {
    _state =
        GameScreenState(messages: [], isLoading: false, isGameFinished: false);
    notifyListeners();
  }
}
