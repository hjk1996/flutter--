import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_project/domain/model/last_word.dart';

abstract class AIRepository {
  Future<Set<String>?> findAdjacentWords(String word);

  Future<Set<String>> loadKillerWords();

  Future<LastWord?> getLastWordInfo(String lastWord);

  Future test(Set<String> words);

  // Future<Set<int>?> getEdgeByWord(String word);

  // Future<int?> getIndexByWord(String word);

  // Future<String?> getWordByIndex(int index);

  // Future<Set<String>?> findKillerWords(Set<int> wordIndices);

  // Future<List<Set<int>>?> getEdgesByIndices(Set<int> indices);

  // Future<List<Map>?> getWordInfosByIndice(Set<int> indices);

}
