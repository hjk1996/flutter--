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
      GameScreenState(messages: [], isLoading: false, isPlaying: false);
  GameScreenState get state => _state;

  final Stopwatch _stopwatch = Stopwatch();
  int get elapsed => _stopwatch.elapsedTicks;
  Timer? timer;

  final _eventController = StreamController<GameScreenEvent>();
  Stream<GameScreenEvent> get eventStream => _eventController.stream;

  // TODO: 타이머 기능 구현하기;
  void setTimer() {
    _stopwatch.start();
    var duration = _stopwatch.elapsed;
    timer = Timer(const Duration(seconds: 7), () {});
  }

  Future<void> sendMessage(String word) async {
    _updateMessage(
        id: FirebaseAuth.instance.currentUser!.uid,
        content: word,
        isErrorMessage: false,
        updateLastWord: false);
    await _calculateNextMove(word);
  }

  void _startLoading() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
  }

  void _endLoading() {
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void _updateMessage({
    required String id,
    required String content,
    required bool isErrorMessage,
    bool updateLastWord = false,
  }) {
    final message = Message(
        id: id,
        content: content,
        createdAt: DateTime.now().microsecondsSinceEpoch,
        isErrorMessage: isErrorMessage);
    _state = _state.copyWith(
      messages: [message, ..._state.messages],
      lastValidMessage: updateLastWord ? message : _state.lastValidMessage,
    );
    notifyListeners();
  }

  void _whenPlaying(Move nextMove) {
    _updateMessage(
        id: _aiPlayer.id,
        content: nextMove.word,
        isErrorMessage: false,
        updateLastWord: true);
  }

  void _whenPlayerWin() {
    _state = _state.copyWith(
      isPlaying: false,
    );
    _eventController.add(const GameScreenEvent.onPlayerWin());
  }

  void _whenPlayerLose() {
    _state = _state.copyWith(
      isPlaying: false,
    );
    _eventController.add(const GameScreenEvent.onPlayerLose());
  }

  void _whenWordError(Move nextMove) {
    _updateMessage(
        id: _aiPlayer.id,
        content: nextMove.word,
        isErrorMessage: true,
        updateLastWord: false);
  }

  void _whenError(Move nextMove) {
    _eventController.add(GameScreenEvent.onError(nextMove.word));
  }

  Future<void> _calculateNextMove(String word) async {
    _startLoading();
    final Move nextMove = await _aiPlayer.calculateNextMove(word);
    switch (nextMove.gameStatus) {
      case GameStatus.playing:
        _whenPlaying(nextMove);
        break;
      case GameStatus.playerWin:
        _whenPlayerWin();
        break;
      case GameStatus.playerLose:
        _whenPlayerLose();
        break;
      case GameStatus.wordError:
        _whenWordError(nextMove);
        break;
      case GameStatus.error:
        _whenError(nextMove);
        break;
      default:
    }
    _endLoading();
  }

  Future<void> initGame() async {
    await _aiPlayer.initGame();
  }

  Future<void> startGame(bool playerFirst) async {
    _state = GameScreenState(messages: [], isLoading: false, isPlaying: true);
    notifyListeners();
    if (!playerFirst) {
      final Move move = await _aiPlayer.pickRandomStarter();
      _updateMessage(
        id: _aiPlayer.id,
        content: move.word,
        isErrorMessage: false,
        updateLastWord: true,
      );
    }
  }
}
