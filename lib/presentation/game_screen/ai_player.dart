import 'dart:convert';

import 'package:text_project/domain/repository/ai_repository.dart';

enum AIStatus { playing, givingUp, warning }

class NextMove {
  String? word;
  final AIStatus aiStatus;
  NextMove({required this.aiStatus, this.word});
}

class AIPlayer {
  final AIRepository aiRepository;
  AIPlayer({required this.aiRepository});

  Set<int>? killerWordIndices;

  Future<NextMove> takeNextMove(String word, Set<int> usedWordIndices) async {
    final edge = await aiRepository.getEdgeByWord(word);
    if (edge == null) {
      // 단어가 등록되어있지 않음
      // 플레이어에게 제대로 된 단어를 입력하라고 메시지 보내야함.
      return NextMove(aiStatus: AIStatus.warning);
    }

    // 다음 스텝 계산을 위해 반환받은 엣지와 이미 사용한 단어의 차집합을 구함.
    final possibleWordIndices = edge.difference(usedWordIndices);

    // 차집합이 공집합이라면
    if (possibleWordIndices.isEmpty) {
      // AI가 게임에서 짐
      return NextMove(aiStatus: AIStatus.givingUp);
    }

    // 차집합이 공집합이 아니라면 사용할 수 있는 단어 중 한방 단어를 찾음
    final killerWordIndices =
        await aiRepository.findKillerWordIndices(possibleWordIndices).then(
              (set) => set?.toList()?..shuffle(),
            );

    // 한방 단어가 없을 때 행동을 취함
    if (killerWordIndices == null) {
      return _moveWhenNoKillerWords(possibleWordIndices);
    }

    // 한방 단어가 있다면 한방 단어를 사용함
    final nextWord = await aiRepository.getWordByIndex(killerWordIndices.first);
    return NextMove(aiStatus: AIStatus.playing, word: nextWord);
  }

  // 한방 단어가 없을 때의 행동
  Future<NextMove> _moveWhenNoKillerWords(Set<int> indices) async {
    // 사용가능한 단어 중에서 한방 단어로 이어지지 않을 단어 중 하나를 반환해야함
    final safeWord = await _findSafeWord(indices);
    // 안전한 단어가 없다면
    if (safeWord == null) {
      final wordIndexList = indices.toList()..shuffle();
      // 갈 수 있는 단어 중 아무 단어나 반환함
      final nextWord = await aiRepository.getWordByIndex(wordIndexList.first);
      return NextMove(aiStatus: AIStatus.playing, word: nextWord);
    }
    // 안전한 단어가 있다면 안전한 단어를 반환함.
    return NextMove(aiStatus: AIStatus.playing, word: safeWord);
  }

  Future<void> loadAllKillerWordIndices() async {
    killerWordIndices ??= await aiRepository.loadAllKillerWordIndices();
  }

  // 한방 단어로 이어지지 않을 안전한 단어를 탐색함
  Future<String?> _findSafeWord(Set<int> wordIndices) async {
    final wordInfos = await aiRepository.getWordInfosByIndices(wordIndices);
    if (wordInfos == null) return null;
    wordInfos.shuffle();
    for (Map info in wordInfos) {
      final Set<int> edge = Set.from(jsonDecode(info['edge'] as String));
      // 안전한 단어를 찾았다면
      if (edge.intersection(killerWordIndices!).isEmpty) {
        // 안전한 단어를 반환함
        return info['word'];
      }
    }
    // 안전한 단어를 찾지못하면 null을 반환함
    return null;
  }
}
