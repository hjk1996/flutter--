import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:text_project/di/di.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/domain/repository/words_repo.dart';
import 'package:text_project/presentation/game_screen/bl/player.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/game_screen_event.dart';
import 'package:text_project/presentation/game_screen/game_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreenViewModel with ChangeNotifier {
  final Referee _referee;
  GameScreenViewModel({required Referee referee}) : _referee = referee;

  GameScreenState _state =
      GameScreenState(messages: [], isLoading: false, isPlaying: false);
  GameScreenState get state => _state;

  Referee get referee => _referee;

  StreamSubscription<RefereeResponse>? _refereeSubscription;

  final _eventController = StreamController<GameScreenEvent>.broadcast();
  Stream<GameScreenEvent> get eventStream => _eventController.stream;

  // 유저가 viewModel에 message를 보냄
  // viewModel은 다시 referee에게 message를 전달함.
  Future<void> sendMessage(String word) async {
    final message = Message(
      id: FirebaseAuth.instance.currentUser!.uid,
      messageType: MessageType.playing,
      content: word,
      createdAt: DateTime.now().microsecondsSinceEpoch,
    );
    _updateMessage(message: message);
    _startLoading();
    await _referee.receiveMessage(message);
    _endLoading();
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

  Future<void> init() async {
    await _referee.init();
    _refereeSubscription ??=
        _referee.refereeResponseStream.listen(_handleRefereeResponse);
  }

  // referee가 상대의 단어를 확인하고 올바른 경우 다음 차례의 플레이어에게 행동을 요구할 때 발동
  void _whenAskNextMove() {
    // 처음 시작할 때 null check 오류 발생하는거 방지하기 위해서 조건 달아놓음.
    if (referee.lastValidMessage == null) return;
    if (referee.lastValidMessage!.id !=
        FirebaseAuth.instance.currentUser!.uid) {
      _state = _state
          .copyWith(messages: [referee.lastValidMessage!, ..._state.messages]);
      notifyListeners();
    }
  }

  // referee가 단어가 올바르지 않다는 이벤트를 발생시켰을 경우 발동
  void _whenNotValidWord(RefereeResponse response) {
    _state = _state.copyWith(messages: [response.message!, ..._state.messages]);
    notifyListeners();
  }

  // referee가 game이 끝났다는 이벤트를 발생시켰을 경우 발동
  void _whenGameEnd(RefereeResponse response) {
    _state = _state.copyWith(isLoading: false, isPlaying: false);
    notifyListeners();
    _eventController.add(GameScreenEvent.onGameEnd(response));
  }

  // referee의 noti를 처리해주는 함수
  Future<void> _handleRefereeResponse(RefereeResponse response) async {
    switch (response.responseTypes) {
      case RefereeResponseTypes.askNextMove:
        _whenAskNextMove();
        break;
      case RefereeResponseTypes.notValidWord:
        _whenNotValidWord(response);
        break;
      case RefereeResponseTypes.gameEnd:
        _whenGameEnd(response);
        break;
      default:
        break;
    }
  }

  // 게임 시작할 때 선수를 등록함.
  Future<void> startGame(bool playerFirst) async {
    // endGame();
    _state = GameScreenState(
      messages: [],
      isLoading: false,
      isPlaying: true,
    );

    final player =
        Player(referee: referee, id: FirebaseAuth.instance.currentUser!.uid);
    final otherPlayer = makeExpertBot(referee);

    if (playerFirst) {
      _referee.startGame(player1: player, player2: otherPlayer);
    } else {
      _referee.startGame(player1: otherPlayer, player2: player);
    }

    notifyListeners();
  }

  void endGame() {
    _referee.endGame();
    _state = _state.copyWith(
      messages: List.from(_referee.messages.reversed),
      isLoading: false,
      isPlaying: false,
    );
    notifyListeners();
  }

  void resetChat() {
    _state = GameScreenState(messages: [], isLoading: false, isPlaying: false);
    notifyListeners();
  }

  Future<void> saveWord(String word) async {
    try {
      final repo = GetIt.instance<WordsRepo>();
      final wordInfo = await repo.getWordInfo(word);
      final prefs = await SharedPreferences.getInstance();
      var oldData = prefs.getString('note');
      Map<String, dynamic> newData = oldData == null ? {} : jsonDecode(oldData);
      newData[word] = {'meanings': wordInfo.meanings};
      await prefs.setString(word, jsonEncode(newData));
    } on FirebaseException catch (err) {
      _eventController.add(
        const GameScreenEvent.onError('서버에서 단어에 대한 정보를 받아오지 못했습니다.'),
      );
    } catch (err) {
      _eventController.add(
        const GameScreenEvent.onError('단어를 저장하는 중 알 수 없는 에러가 발생했습니다.'),
      );
    }
  }

  @override
  void dispose() {
    _refereeSubscription?.cancel();
    _eventController.close();
    super.dispose();
  }
}
