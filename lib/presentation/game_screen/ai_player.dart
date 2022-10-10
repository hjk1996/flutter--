import 'package:text_project/domain/repository/ai_repository.dart';

class AIPlayer {
  final AIRepository aiRepository;
  AIPlayer({required this.aiRepository});

  takeNextMove(String word, Set<int> usedWordIndices) async {
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

    // 차집합이 공집합이 아니라면 한방 단어를 찾음
    final killerWordIndices =
        await aiRepository.findKillerWordIndices(possibleWordIndices);

    // 한방 단어가 없다면
    if (killerWordIndices == null) {
      // 사용가능한 단어 중에서 한방 단어로 이어지지 않을 단어 중 하나를 반환해야함
      final safeWordIndices = await findSafeWordIndices(possibleWordIndices);
    }
  }

  // TO-DO: edge와 index를 동시에 받아야 어떤 단어가 안전한 단어인지 알 수 있음
  Future<Set<int>?> findSafeWordIndices(Set<int> wordIndices) async {
    final possibleNextMoves =
        await aiRepository.getEdgesByIndices(wordIndices);

    if (possibleNextMoves == null) return null;

  }
}
