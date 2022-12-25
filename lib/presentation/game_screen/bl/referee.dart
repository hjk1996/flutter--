import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:text_project/domain/model/game_log.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/domain/model/user_stat.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/presentation/common/constants.dart';
import 'package:text_project/presentation/game_screen/bl/player.dart';
import 'package:text_project/presentation/game_screen/bl/player_abc.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';
import 'package:text_project/presentation/game_screen/components/game_setting_dialog.dart';

enum RefereeResponseTypes {
  // askRobotToMove,
  // player에게 반응요구하는 이벤트
  askNextMove,
  // 올바른 단어가 아닐때 발생시키는 이벤트
  notValidWord,
  // 게임 끝났을 때(둘 중 한명 패배) 발생시키는 이벤트
  gameEnd,
  // 오류 발생했을 때 발생시키는 이벤트
  error,
}

class RefereeResponse {
  final RefereeResponseTypes responseTypes;
  final String target;
  Message? message;
  RefereeResponse({
    required this.responseTypes,
    required this.target,
    this.message,
  });
}

class RefereeException implements Exception {
  final String cause;
  RefereeException({required this.cause});
}

class Referee {
  final FirestoreRepo repo;
  int? _turnTime = 0;
  Referee({required this.repo});

  final id = REFEREE_ID;

  final _refereeResponseController =
      StreamController<RefereeResponse>.broadcast();
  Stream<RefereeResponse> get refereeResponseStream =>
      _refereeResponseController.stream;

  Timer? timer;
  PlayerABC? _player1;
  PlayerABC? _player2;
  PlayerABC? _playerOnTurn;
  PlayerABC? get playerOnTurn => _playerOnTurn;
  PlayerABC? _winner;
  PlayerABC? _loser;
  List<Message> _messages = [];
  List<Message> get messages => _messages;
  Message? get lastValidMessage => _messages.isEmpty ? null : _messages.last;
  Set<String> get usedWords => Set.from(
        messages.map((message) => message.content),
      );
  GameSetting? _setting;
  Map<String, dynamic>? _dooumMap;
  Set<String>? _killerWords;
  Set<String>? get killerWords => _killerWords;

  // 게임시작할 때 선수 등록하고 다음 동작 요청함.
  void startGame(
      {required GameSetting setting,
      required PlayerABC player1,
      required PlayerABC player2}) {
    _messages = [];
    _setting = setting;
    switch (setting.difficulty) {
      case GameDifficulty.easy:
        _turnTime = TurnTime.easy;
        break;
      case GameDifficulty.normal:
        _turnTime = TurnTime.normal;
        break;
      case GameDifficulty.hard:
        _turnTime = TurnTime.hard;
        break;
      case GameDifficulty.impossible:
        _turnTime = TurnTime.impossible;
        break;
    }
    _player1 = player1;
    _player1!.init();
    _player2 = player2;
    _player2!.init();
    _playerOnTurn = player1;
    _setTimer(_turnTime!);
    _refereeResponseController.sink.add(
      RefereeResponse(
        responseTypes: RefereeResponseTypes.askNextMove,
        target: _playerOnTurn!.id!,
      ),
    );
  }

  Future<void> sendLog() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      if (_messages.isNotEmpty) {
        final log = GameLog(
          difficulty: _setting!.difficulty,
          endAt: DateTime.now(),
          id: uid,
          win: FirebaseAuth.instance.currentUser!.uid == _winner!.id,
          log: _messages,
        );
        await repo.sendGameLog(log);
        await repo.updateUserStatAfterGame(log);
      }
    } catch (err) {
      _refereeResponseController.sink.add(RefereeResponse(
        responseTypes: RefereeResponseTypes.error,
        target: uid,
        message: Message(
          content: '서버에 로그를 보내는데 실패했습니다.',
          id: id,
          messageType: MessageType.error,
          createdAt: DateTime.now(),
        ),
      ));
    }
  }

  void endGame() {
    timer?.cancel();
    _player1?.dispose();
    _player2?.dispose();
    _player1 = null;
    _player2 = null;
    _playerOnTurn = null;
    _winner = null;
    _loser = null;
    _setting = null;
  }

  Future<void> _whenPlayerPlaying(Message message) async {
    final errorMessage = await _validateMessage(message);

    if (errorMessage != null) {
      return _refereeResponseController.sink.add(
        RefereeResponse(
          responseTypes: RefereeResponseTypes.notValidWord,
          target: message.id,
          message: Message(
            content: errorMessage,
            id: id,
            createdAt: DateTime.now(),
            messageType: MessageType.error,
          ),
        ),
      );
    } else {
      _offTimer();
      _setTimer(_turnTime!);
      _messages.add(message);
      _switchTurn();

      _refereeResponseController.sink.add(
        RefereeResponse(
          responseTypes: RefereeResponseTypes.askNextMove,
          target: playerOnTurn == _player1 ? _player1!.id! : _player2!.id!,
          message: lastValidMessage,
        ),
      );
    }
  }

  Future<void> _whenPlayerGiveUp(Message message) async {
    if (message.id == _player1!.id) {
      _loser = _player1;
      _winner = _player2;
    } else {
      _loser = _player2;
      _winner = _player1;
    }

    _refereeResponseController.sink.add(
      RefereeResponse(
        responseTypes: RefereeResponseTypes.gameEnd,
        target: message.id,
      ),
    );

    await sendLog();
  }

  Future<void> _whenTimeOut(Message message) async {
    if (message.id == _player1!.id) {
      _loser = _player1;
      _winner = _player2;
    } else {
      _loser = _player2;
      _winner = _player1;
    }

    _refereeResponseController.sink.add(
      RefereeResponse(
        responseTypes: RefereeResponseTypes.gameEnd,
        target: message.id,
      ),
    );

    await sendLog();
  }

  Future<void> receiveMessage(Message message) async {
    switch (message.messageType) {
      case MessageType.playing:
        await _whenPlayerPlaying(message);
        break;
      case MessageType.giveUp:
        await _whenPlayerGiveUp(message);
        break;
      case MessageType.timeOut:
        await _whenTimeOut(message);
        break;
      case MessageType.error:
        break;
    }
  }

  void _switchTurn() {
    _playerOnTurn = _playerOnTurn == _player1 ? _player2 : _player1;
  }

  void _setTimer(int seconds) {
    timer = Timer(
      Duration(seconds: seconds),
      _timerCallback,
    );
  }

  // timeout, giveup
  void _timerCallback() {
    receiveMessage(
      Message(
        id: playerOnTurn!.id!,
        messageType: MessageType.timeOut,
        content: '',
        createdAt: DateTime.now(),
      ),
    );
  }

  void _offTimer() {
    timer?.cancel();
    timer = null;
  }

  Future<String?> _validateMessage(Message message) async {
    if (message.content.length != 3) {
      return "세글자인 단어만 입력할 수 있습니다";
    }

    if (usedWords.contains(message.content)) {
      return "이미 사용한 단어입니다.";
    }

    if (lastValidMessage != null) {
      final String firstCharacter = message.content.substring(0, 1);
      final String lastCharacter =
          lastValidMessage!.content.substring(message.content.length - 1);
      final lastCharacterDooum = _dooumMap![lastCharacter];

      if (firstCharacter != lastCharacter &&
          firstCharacter != lastCharacterDooum) {
        return '이어지지 않는 단어입니다.';
      }
    }

    if (_killerWords!.contains(message.content) && usedWords.length <= 1) {
      return "차례가 한 번씩 돌아간 이후에 한방 단어를 사용할 수 있습니다.";
    }

    try {
      if (!await repo.checkWordExists(message.content)) {
        return "존재하지 않는 단어입니다.";
      }
    } catch (err) {
      return '서버에서 단어에 대한 정보를 받아올 수 없습니다. 인터넷 연결 상태를 확인하세요.';
    }

    return null;
  }

  Future<void> init() async {
    _killerWords ??= await repo.loadKillerWords();
    _dooumMap ??= await repo.loadDooumMap();
  }
}
