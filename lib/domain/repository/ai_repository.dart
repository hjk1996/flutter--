abstract class AIRepository {
  Future<Set<int>?> getEdgeByWord(String word);

  Future<int?> getWordIndexByWord(String word);

  Future<Set<int>?> findKillerWordIndices(Set<int> wordIndices);

  Future<List<Set<int>>?> getEdgesByIndices(Set<int> indices);

  Future<List<Map>?> getWordInfosByIndices(Set<int> indices);
}
