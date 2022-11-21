import 'dart:async';

import 'package:text_project/domain/model/message.dart';
import 'package:text_project/domain/repository/words_repo.dart';
import 'package:text_project/presentation/game_screen/bl/player_abc.dart';

enum RefereeResponseTypes {
  // viewModel 이벤트 & player 이벤트
  askNextMove,
  // viewModel 이벤트
  notValidWord,
  // viewModel 이벤트
  gameEnd,
  // viewModel 이벤트
  errorOccured,
}

class RefereeResponse {
  final RefereeResponseTypes responseTypes;
  final String target;
  String? message;
  RefereeResponse({
    required this.responseTypes,
    required this.target,
    this.message,
  });
}

class Referee {
  final WordsRepo firebaseRepo;
  Referee({required this.firebaseRepo});

  final _eventController = StreamController<RefereeResponse>.broadcast();
  Stream<RefereeResponse> get eventStream => _eventController.stream;

  Timer? timer;

  PlayerABC? _player1;
  PlayerABC? _player2;
  PlayerABC? playerOnTurn;

  Message? _lastValidMessage;
  Message? get lastValidMessage => _lastValidMessage;
  Set<String> _usedWords = Set();
  Set<String> get usedWords => _usedWords;

  Map<String, dynamic>? _dooumMap;
  Set<String>? _killerWords;
  Set<String>? get killerWords => _killerWords;

  void registerPlayers(
      {required PlayerABC player1, required PlayerABC player2}) {
    _player1 = player1;
    _player2 = player2;
    playerOnTurn = player1;
  }

  void releasePlayers() {
    _player1 = null;
    _player2 = null;
    playerOnTurn = null;
  }

  Future<void> receiveMessage(Message message) async {
    final errorMessage = await _validateMessage(message);
    if (errorMessage != null) {
      return _eventController.add(
        RefereeResponse(
          responseTypes: RefereeResponseTypes.notValidWord,
          target: message.id,
          message: errorMessage,
        ),
      );
    }

    _offTimer();
    _setTimer(7);
    _switchTurn();
    _lastValidMessage = message;
    _usedWords.add(message.content);
    _eventController.add(
      RefereeResponse(
          responseTypes: RefereeResponseTypes.askNextMove,
          target: playerOnTurn == _player1 ? _player1!.id! : _player2!.id!,
          message: message.content),
    );
  }

  void _switchTurn() {
    playerOnTurn = playerOnTurn == _player1 ? _player2 : _player1;
  }

  // Timer 콜백 설정하기;
  void _setTimer(int seconds) {
    timer = Timer(Duration(seconds: seconds), () {
      _eventController.add(
        RefereeResponse(
          responseTypes: RefereeResponseTypes.gameEnd,
          target: playerOnTurn!.id!,
        ),
      );
    });
  }

  void _offTimer() {
    timer?.cancel();
  }

  Future<String?> _validateMessage(Message message) async {
    if (message.content.length != 3) {
      return "세글자인 단어만 입력할 수 있습니다";
    }

    if (_usedWords.contains(message.content)) {
      return "이미 사용한 단어입니다.";
    }

    if (lastValidMessage != null) {
      final String firstCharacter = message.content.substring(0, 1);
      final String lastCharacter =
          _lastValidMessage!.content.substring(message.content.length - 1);
      final lastCharacterDooum = _dooumMap![lastCharacter];

      if (firstCharacter != lastCharacter &&
          firstCharacter != lastCharacterDooum) {
        return '이어지지 않는 단어입니다.';
      }
    }

    if (_killerWords!.contains(message.content) && _usedWords.length <= 2) {
      return "차례가 한 번씩 돌아간 이후에 한방 단어를 사용할 수 있습니다.";
    }

    final bool wordExists = await firebaseRepo.checkWordExists(message.content);

    if (!wordExists) {
      return "존재하지 않는 단어입니다.";
    }

    return null;
  }

  void resetGame() {
    _lastValidMessage = null;
    _usedWords = Set();
  }

  Future<void> init() async {
    _killerWords ??= await firebaseRepo.loadKillerWords();
    _dooumMap ??= await firebaseRepo.loadDooumMap();
  }

  void dispose() async {}
}
