import 'dart:async';
import 'dart:math';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/bl/player_abc.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';

enum GameDifficulty {
  easy,
  normal,
  hard,
  impossible,
}

class RobotPlayer extends RobotPlayerABC {
  final GameDifficulty difficulty;
  late double _killerThreshold;
  late double _safeThreshold;
  RobotPlayer({
    required this.difficulty,
    required super.referee,
    required super.wordsRepo,
  }) {
    // threshold 보다 랜덤한 숫자가 높으면 행동을 취함
    switch (difficulty) {
      case GameDifficulty.easy:
        _killerThreshold = 0.95;
        _safeThreshold = 0.3;
        break;
      case GameDifficulty.normal:
        _killerThreshold = 0.65;
        _safeThreshold = 0.4;
        break;
      case GameDifficulty.hard:
        _killerThreshold = 0.6;
        _safeThreshold = 0.1;
        break;
      case GameDifficulty.impossible:
        _killerThreshold = 0;
        _safeThreshold = 0;
        break;
    }
  }

  final _random = Random();
  final String _id = 'ROBOT EXPERT';
  String get id => _id;

  @override
  void init() {
    refereeSubscription = referee.refereeResponseStream.listen(
      (response) {
        if (response.target != id) return;
        if (response.responseTypes == RefereeResponseTypes.askNextMove) {
          move();
        }
      },
    );
  }

  @override
  void dispose() {
    refereeSubscription!.cancel();
  }

  @override
  Future<void> move() async {
    // 처음 시작할 때
    if (referee.lastValidMessage == null) {
      final starter = await pickRandomStarter();
      return referee.receiveMessage(
        Message(
            id: id,
            messageType: MessageType.playing,
            content: starter,
            createdAt: DateTime.now().microsecondsSinceEpoch),
      );
    }

    final adjWords =
        await wordsRepo.findAdjacentWords(referee.lastValidMessage!.content);
    final Set<String> availableWords = adjWords!.difference(referee.usedWords);

    // 만약에 사용할 수 있는 다음 단어가 없다면 유저 승리
    if (availableWords.isEmpty) {
      return referee.receiveMessage(
        Message(
          id: id,
          messageType: MessageType.giveUp,
          content: '',
          createdAt: DateTime.now().microsecondsSinceEpoch,
        ),
      );
    }

    // 한방 단어와 사용할 수 있는 단어의 교집합을 통해 사용할 수 있는 한방 단어를 구함.
    final Set<String> availableKillerWords =
        referee.killerWords!.intersection(availableWords);

    // 여기 위까지는 공통
    // 아래부터는 난이도에 따라서 달라짐.

    // 사용할 수 있는 한방 단어가 존재하고 차례가 한 번 이상 돌았다면 한방 단어를 사용함.
    if (availableKillerWords.isNotEmpty && referee.usedWords.length >= 2) {
      // 한방 단어를 사용할 확률을 난이도에 따라 다르게 함.
      if (_random.nextDouble() >= _killerThreshold) {
        final String randomKiller =
            _pickRandomWordFromSet(availableKillerWords);
        return referee.receiveMessage(
          Message(
            id: id,
            messageType: MessageType.playing,
            content: randomKiller,
            createdAt: DateTime.now().microsecondsSinceEpoch,
          ),
        );
      }
    }

    // 사용할 수 있는 한방 단어가 존재하지 않는 경우 안전한 단어를 사용함.
    // 안전한 단어 = 상대방이 내 단어를 이어받아서 한방 단어를 말할 수 없는 단어.
    if (_random.nextDouble() >= _safeThreshold) {
      for (var word in availableWords.toList()..shuffle()) {
        if (await _isSafeWord(word)) {
          return referee.receiveMessage(
            Message(
              id: id,
              messageType: MessageType.playing,
              content: word,
              createdAt: DateTime.now().microsecondsSinceEpoch,
            ),
          );
        }
      }
    }

    // 안전한 단어가 없으면 그냥 아무 단어나 반환함.
    return referee.receiveMessage(
      Message(
          id: id,
          messageType: MessageType.playing,
          content: _pickRandomWordFromSet(availableWords),
          createdAt: DateTime.now().microsecondsSinceEpoch),
    );
  }

  String _pickRandomWordFromSet(Set<String> words) {
    return words.toList()[Random().nextInt(words.length)];
  }

  Future<bool> _isSafeWord(String word) async {
    final lastWordInfo =
        await wordsRepo.getLastWordInfo(word.substring(word.length - 1));

    return !lastWordInfo.followingWords.any((element) => element.killer);
  }
}
