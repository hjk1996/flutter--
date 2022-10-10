import 'package:flutter/cupertino.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/ai_player.dart';
import 'package:text_project/presentation/game_screen/game_screen_state.dart';

class GameScreenViewModel with ChangeNotifier {
  GameScreenState _state = GameScreenState(messages: []);
  GameScreenState get state => _state;
  AIPlayer? _aiPlayer;

  bool sendMessage(String content) {
    if (_validateMessage(content)) {
      _state = _state.copyWith(
        messages: [
          ..._state.messages,
          Message(
            content: content,
            isMe: true,
            createdAt: DateTime.now().microsecondsSinceEpoch,
          ),
        ],
      );
      notifyListeners();

      return true;
    }

    return false;
  }

  Future<void> loadAIPlayer() async {
  }

  void resetState() {
    _state = GameScreenState(messages: []);
    notifyListeners();
  }

  bool _validateMessage(String content) {
    if (content != null && content.isNotEmpty) {
      return true;
    }

    return false;
  }
}
