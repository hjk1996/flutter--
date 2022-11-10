import 'package:flutter/cupertino.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/ai_player.dart';
import 'package:text_project/presentation/game_screen/game_screen_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameScreenViewModel with ChangeNotifier {
  final AIPlayer _aiPlayer;
  GameScreenViewModel({required AIPlayer aiPlayer}) : _aiPlayer = aiPlayer;

  GameScreenState _state = GameScreenState(messages: []);
  GameScreenState get state => _state;

  bool sendMessage(String word) {
    if (_validateWord(word)) {
      _state = _state.copyWith(
        messages: [
          ..._state.messages,
          Message(
            content: word,
            isMe: true,
            createdAt: DateTime.now().microsecondsSinceEpoch,
          ),
        ],
      );
      notifyListeners();
      _aiPlayer.calculateNextMove(word);
      return true;
    }

    return false;
  }

  Future<void> startGame() async {
    await _aiPlayer.startGame();
  }

  void resetState() {
    _state = GameScreenState(messages: []);
    notifyListeners();
  }

  bool _validateWord(String word) {
    if (word != null && word.isNotEmpty) {
      return true;
    }

    return false;
  }
}
