import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:text_project/domain/repository/ai_repository.dart';

enum GameStatus { playerWin, playerLose, playing, wordError, error }

class Move {
  final String word;
  final GameStatus gameStatus;
  Move({required this.gameStatus, required this.word});
}

class AIPlayer {
  final AIRepository aiRepository;
  AIPlayer({required this.aiRepository});

  final String _id = 'AI EXPERT';
  String get id => _id;

  Set<String> _usedWordsSet = Set();
  Set<String> get usedWordSet => _usedWordsSet;
  int get turnCount => _usedWordsSet.length;

  late Set<String> _killerWords;

  Future<void> initGame() async {
    await _loadKillerWords();
  }

  void resetGame() {
    _usedWordsSet = Set();
  }

  Future<Move> pickRandomStarter() async {
    final word = await aiRepository.getRandomNonKillerWord();
    _usedWordsSet.add(word);
    return Move(gameStatus: GameStatus.playing, word: word);
  }

  Future<void> _loadKillerWords() async {
    _killerWords = await aiRepository.loadKillerWords();
  }

  Future<Move> calculateNextMove(String? word) async {
    try {
      final isValid = _validateWord(word);
      if (isValid != null) {
        return Move(gameStatus: GameStatus.wordError, word: isValid);
      }

      final adjWords = await aiRepository.findAdjacentWords(word!);

      // 유저가 잘못된 단어를 입력한 경우 경고를 보냄.
      if (adjWords == null) {
        return Move(gameStatus: GameStatus.wordError, word: '존재하지 않는 단어입니다.');
      }

      // 유저가 이미 사용한 단어를 입력한 경우 경고를 보냄.
      if (_usedWordsSet.contains(word)) {
        return Move(gameStatus: GameStatus.wordError, word: '이미 사용한 단어입니다.');
      }

      // 잘못된 단어도 아니고 사용한 단어도 아니면 일단 사용한 단어 리스트에 추가.
      _usedWordsSet.add(word);

      // 인접 단어의 집합에서 사용한 단어의 집합을 빼서 사용할 수 있는 단어의 집합을 구함.
      final Set<String> availableWords = adjWords.difference(_usedWordsSet);

      // 만약에 사용할 수 있는 다음 단어가 없다면
      if (availableWords.isEmpty) {
        // 그리고 각각 턴이 한 번 이상 돌았다면 유저 승리
        if (turnCount > 2) {
          return Move(gameStatus: GameStatus.playerWin, word: word);
        } else {
          return Move(
              gameStatus: GameStatus.wordError,
              word: '차례가 한 번씩 돌아간 이후에 한방 단어를 사용할 수 있습니다.');
        }
      }

      // 한방 단어와 사용할 수 있는 단어의 교집합을 통해 사용할 수 있는 한방 단어를 구함.
      final Set<String> availableKillerWords =
          _killerWords.intersection(availableWords);

      // 사용할 수 있는 한방 단어가 존재하고 차례가 한 번 이상 돌았다면 한방 단어를 사용함.
      if (availableKillerWords.isNotEmpty && turnCount > 2) {
        final String randomKiller =
            _pickRandomWordFromSet(availableKillerWords);
        _usedWordsSet.add(randomKiller);
        return Move(gameStatus: GameStatus.playing, word: randomKiller);
      }

      // 사용할 수 있는 한방 단어가 존재하지 않는 경우 안전한 단어를 사용함.
      // 안전한 단어 = 상대방이 내 단어를 이어받아서 한방 단어를 말할 수 없는 단어.
      for (var word in availableWords.toList()..shuffle()) {
        final bool isSafe = await _isSafeWord(word);
        if (isSafe) {
          _usedWordsSet.add(word);
          return Move(gameStatus: GameStatus.playing, word: word);
        }
      }

      // 안전한 단어가 없으면 그냥 아무 단어나 반환함.
      final randomWord = _pickRandomWordFromSet(availableKillerWords);
      _usedWordsSet.add(randomWord);
      return Move(
        gameStatus: GameStatus.playing,
        word: randomWord,
      );
    } on FirebaseException catch (err) {
      return Move(
          gameStatus: GameStatus.error,
          word: err.message ?? '파이어베이스 에러가 발생했습니다.');
    } on Exception catch (err) {
      return Move(gameStatus: GameStatus.error, word: err.toString());
    }
  }

  String _pickRandomWordFromSet(Set<String> words) {
    return words.toList()[Random().nextInt(words.length)];
  }

  Future<bool> _isSafeWord(String word) async {
    final lastWordInfo =
        await aiRepository.getLastWordInfo(word.substring(word.length - 1));

    return !lastWordInfo.followingWords.any((element) => element.killer);
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
}
