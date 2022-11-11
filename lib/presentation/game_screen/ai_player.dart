import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:text_project/domain/repository/ai_repository.dart';

enum GameStatus { win, play, giveUp, notExists, usedWord, invalidWord, error }

class NextMove {
  String? word;
  final GameStatus gameStatus;
  NextMove({required this.gameStatus, this.word});
}

class AIPlayer {
  final AIRepository aiRepository;
  AIPlayer({required this.aiRepository});

  final _usedWordsSet = Set();
  late Set<String> _killerWords;

  Future<void> startGame() async {
    await _loadKillerWords();
    await _test();
  }

  Future<void> _loadKillerWords() async {
    _killerWords = await aiRepository.loadKillerWords();
  }

  Future _test() async {
    // final result = await aiRepository.test({'가결안', '가결의'});
    // print(result.docs);
  }

  Future<NextMove> calculateNextMove(String? word) async {
    try {
      final isValid = _validateWord(word);
      if (isValid != null) {
        return NextMove(gameStatus: GameStatus.invalidWord, word: isValid);
      }

      final adjWords = await aiRepository.findAdjacentWords(word!);

      // 유저가 잘못된 단어를 입력한 경우 경고를 보냄.
      if (adjWords == null) {
        return NextMove(
            gameStatus: GameStatus.notExists, word: '존재하지 않는 단어입니다.');
      }

      // 유저가 이미 사용한 단어를 입력한 경우 경고를 보냄.
      if (_usedWordsSet.contains(word)) {
        return NextMove(gameStatus: GameStatus.usedWord, word: '이미 사용한 단어입니다.');
      }

      // 잘못된 단어도 아니고 사용한 단어도 아니면 일단 사용한 단어 리스트에 추가.
      _usedWordsSet.add(word);

      // 인접 단어의 집합에서 사용한 단어의 집합을 빼서 사용할 수 있는 단어의 집합을 구함.
      final Set<String> availableWords = adjWords.difference(_usedWordsSet);

      // 만약에 사용할 수 있는 다음 단어가 없다면
      if (availableWords.isEmpty) {
        // 게임 패배
        return NextMove(gameStatus: GameStatus.giveUp);
      }

      // 한방 단어와 사용할 수 있는 단어의 교집합을 통해 사용할 수 있는 한방 단어를 구함.
      final Set<String> availableKillerWords =
          _killerWords.intersection(availableWords);

      // 사용할 수 있는 한방 단어가 존재하는 경우 그 중에서 하나를 사용함.
      if (availableKillerWords.isNotEmpty) {
        return NextMove(
            gameStatus: GameStatus.win, word: availableKillerWords.first);
      }

      // 사용할 수 있는 한방 단어가 존재하지 않는 경우 안전한 단어를 사용함.
      // 안전한 단어 = 상대방이 내 단어를 이어받아서 한방 단어를 말할 수 없는 단어.
      // =
      final lastWordInfo = await aiRepository.getLastWordInfo(word[-1]);
      
      // 안전한 단어가 없다면 아무 단어나 반환함.

      return NextMove(gameStatus: GameStatus.play);
    } on FirebaseException catch (err) {
      return NextMove(gameStatus: GameStatus.error, word: err.message);
    } on Exception catch (err) {
      return NextMove(gameStatus: GameStatus.error, word: err.toString());
    }
  }

  // Future<NextMove> takeNextMove(String word, Set<int> prevWords) async {
  //   final edge = await aiRepository.getEdgeByWord(word);
  //   if (edge == null) {
  //     // 단어가 등록되어있지 않음
  //     // 플레이어에게 제대로 된 단어를 입력하라고 메시지 보내야함.
  //     return NextMove(aiStatus: AIStatus.warning);
  //   }

  //   // 다음 스텝 계산을 위해 반환받은 엣지와 이미 사용한 단어의 차집합을 구함.
  //   final possibleWordIndice = edge.difference(prevWords);

  //   // 차집합이 공집합이라면
  //   if (possibleWordIndice.isEmpty) {
  //     // AI가 게임에서 짐
  //     return NextMove(aiStatus: AIStatus.givingUp);
  //   }

  //   // 차집합이 공집합이 아니라면 사용할 수 있는 단어 중 한방 단어를 찾음
  //   final killerWords =
  //       await aiRepository.findKillerWords(possibleWordIndice).then(
  //             (set) => set?.toList()?..shuffle(),
  //           );

  //   // 한방 단어가 없을 때 행동을 취함
  //   if (killerWords == null) {
  //     return _moveWhenNoKillerWords(possibleWordIndice, prevWords);
  //   }

  //   // 한방 단어가 있다면 한방 단어를 사용함
  //   return NextMove(aiStatus: AIStatus.playing, word: killerWords.first);
  // }

  // // 한방 단어가 없을 때의 행동
  // Future<NextMove> _moveWhenNoKillerWords(
  //     Set<int> indice, Set<int> usedWordIndice) async {
  //   // 사용가능한 단어 중에서 한방 단어로 이어지지 않을 단어 중 하나를 반환해야함
  //   final safeWord = await _findSafeWord(indice, usedWordIndice);
  //   // 안전한 단어가 없다면
  //   if (safeWord == null) {
  //     final wordIndexList = indice.toList()..shuffle();
  //     // 갈 수 있는 단어 중 아무 단어나 반환함
  //     final nextWord = await aiRepository.getWordByIndex(wordIndexList.first);
  //     return NextMove(aiStatus: AIStatus.playing, word: nextWord);
  //   }
  //   // 안전한 단어가 있다면 안전한 단어를 반환함.
  //   return NextMove(aiStatus: AIStatus.playing, word: safeWord);
  // }

  // // 한방 단어로 이어지지 않을 안전한 단어를 탐색함
  // Future<String?> _findSafeWord(
  //     Set<int> wordIndice, Set<int> usedWordIndices) async {
  //   final wordInfos = await aiRepository.getWordInfosByIndice(wordIndice);
  //   if (wordInfos == null) return null;
  //   wordInfos.shuffle();
  //   for (Map info in wordInfos) {
  //     final Set<int> edge = Set.from(jsonDecode(info['edge'] as String));
  //     // 안전한 단어를 찾았다면
  //     if (edge
  //         .difference(usedWordIndices)
  //         .difference({info['word_index']})
  //         .intersection(killerWordIndice!)
  //         .isEmpty) {
  //       // 안전한 단어를 반환함
  //       return info['word'];
  //     }
  //   }
  //   // 안전한 단어를 찾지못하면 null을 반환함
  //   return null;
  // }

  // Future<void> quitGame() async {
  //   killerWordIndice = null;
  // }

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
