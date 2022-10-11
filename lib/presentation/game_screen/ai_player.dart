import 'dart:convert';

import 'package:text_project/domain/repository/ai_repository.dart';

class AIPlayer {
  final AIRepository aiRepository;
  AIPlayer({required this.aiRepository});

  Set<int>? killerWordIndices;

  Future takeNextMove(String word, Set<int> usedWordIndices) async {
    final edge = await aiRepository.getEdgeByWord(word);
    if (edge == null) {
      // 단어가 등록되어있지 않음
      // 플레이어에게 제대로 된 단어를 입력하라고 메시지 보내야함.
      return;
    }

    // 다음 스텝 계산을 위해 반환받은 엣지와 이미 사용한 단어의 차집합을 구함.
    final possibleWordIndices = edge.difference(usedWordIndices);

    // 차집합이 공집합이라면
    if (possibleWordIndices.isEmpty) {
      // AI가 게임에서 짐
      return;
    }

    // 차집합이 공집합이 아니라면 사용할 수 있는 단어 중 한방 단어를 찾음
    final killerWordIndices =
        await aiRepository.findKillerWordIndices(possibleWordIndices).then(
              (set) => set?.toList()?..shuffle(),
            );

    // 한방 단어가 없다면
    if (killerWordIndices == null) {
      // 사용가능한 단어 중에서 한방 단어로 이어지지 않을 단어 중 하나를 반환해야함
      final safeWord = await findSafeWord(possibleWordIndices);
      // 안전한 단어가 없다면
      if (safeWord == null) {
        final wordIndexList = possibleWordIndices.toList()..shuffle();
        // 갈 수 있는 단어 중 아무 단어나 반환함
        return aiRepository.getWordByIndex(wordIndexList.first);
      }
      // 안전한 단어가 있다면 안전한 단어를 반환함.
      return safeWord;
    }

    // 한방 단어가 있다면 한방 단어를 사용함
    return aiRepository.getWordByIndex(killerWordIndices.first);
  }

  Future<void> loadAllKillerWordIndices() async {
    killerWordIndices ??= await aiRepository.loadAllKillerWordIndices();
  }

  Future<String?> findSafeWord(Set<int> wordIndices) async {
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
