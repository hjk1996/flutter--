import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:text_project/di/provider_setting.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/bl/player.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/game_screen_event.dart';
import 'package:text_project/presentation/game_screen/game_screen_state.dart';

class GameScreenViewModel with ChangeNotifier {
  // final RobotPlayer _bot;
  // GameScreenViewModel({required RobotPlayer bot}) : _bot = bot;

  GameScreenState _state =
      GameScreenState(messages: [], isLoading: false, isPlaying: false);
  GameScreenState get state => _state;

  late Referee _referee;
  Referee get referee => _referee;

  StreamSubscription? _refereeSubscription;

  final _eventController = StreamController<GameScreenEvent>();
  Stream<GameScreenEvent> get eventStream => _eventController.stream;

  Future<void> sendMessage(String word) async {
    final message = Message(
      id: FirebaseAuth.instance.currentUser!.uid,
      messageType: MessageType.playing,
      content: word,
      createdAt: DateTime.now().microsecondsSinceEpoch,
    );
    _updateMessage(message: message);
    await _referee.receiveMessage(message);
  }

  void _startLoading() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
  }

  void _endLoading() {
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void _updateMessage({required Message message}) {
    _state = _state.copyWith(
      messages: [message, ..._state.messages],
    );
    notifyListeners();
  }

  Future<void> initGame() async {
    _referee = makeRefree();
    await _referee.init();
    _refereeSubscription = _referee.eventStream.listen(_handleRefereeResponse);
  }

  void _whenNotValidWord(RefereeResponse response) {}

  void _whenErrorOccured(RefereeResponse response) {
    _eventController.add(GameScreenEvent.onError(response));
  }

  void _whenGameEnd(RefereeResponse response) {
    _eventController.add(GameScreenEvent.onGameEnd(response));
  }

  // referee의 noti를 처리해주는 함수
  Future<void> _handleRefereeResponse(RefereeResponse response) async {
    switch (response.responseTypes) {
      case RefereeResponseTypes.notValidWord:
        _whenNotValidWord(response);
        break;
      case RefereeResponseTypes.errorOccured:
        _whenErrorOccured(response);
        break;
      case RefereeResponseTypes.gameEnd:
        _whenGameEnd(response);
        break;
      default:
        break;
    }
  }

  Future<void> startGame(bool playerFirst) async {
    _state = GameScreenState(
      messages: [],
      isLoading: false,
      isPlaying: true,
    );
    _referee.registerPlayers(
        player1: playerFirst == true
            ? Player(
                referee: _referee, id: FirebaseAuth.instance.currentUser!.uid)
            : makeExpertBot(_referee),
        player2: playerFirst == true
            ? makeExpertBot(_referee)
            : Player(
                referee: _referee, id: FirebaseAuth.instance.currentUser!.uid));
    notifyListeners();
  }
}
