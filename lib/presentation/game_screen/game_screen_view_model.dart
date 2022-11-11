import 'package:flutter/cupertino.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/ai_player.dart';
import 'package:text_project/presentation/game_screen/game_screen_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameScreenViewModel with ChangeNotifier {
  final AIPlayer _aiPlayer;
  GameScreenViewModel({required AIPlayer aiPlayer}) : _aiPlayer = aiPlayer;

  GameScreenState _state = GameScreenState(messages: [], isLoading: false);
  GameScreenState get state => _state;

  Future<void> sendMessage(String word) async {
    // 단어가 올바르지 않은 경우
    if (!_validateWord(word)) {
      _state = _state.copyWith(
        messages: [
          ..._state.messages,
          Message(
            content: word,
            isMe: true,
            createdAt: DateTime.now().microsecondsSinceEpoch,
          ),
        ],
        isLoading: false,
      );
      notifyListeners();
      return;
    }

    final nextMove = await _aiPlayer.calculateNextMove(word);

    if (nextMove.word != null) {}

    _state = _state.copyWith(
      messages: [
        ..._state.messages,
        Message(
          content: word,
          isMe: true,
          createdAt: DateTime.now().microsecondsSinceEpoch,
        ),
      ],
      isLoading: true,
    );
    notifyListeners();
  }

  Future<void> startGame() async {
    await _aiPlayer.startGame();
  }

  void resetState() {
    _state = GameScreenState(messages: [], isLoading: false);
    notifyListeners();
  }

  bool _validateWord(String word) {
    if (word != null && word.isNotEmpty) {
      return true;
    }

    return false;
  }
}
