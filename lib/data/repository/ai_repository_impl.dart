import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_project/data/data_source/db_helper.dart';
import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/repository/ai_repository.dart';

class AIRepositoryImpl implements AIRepository {
  final FirestoreHelper firestoreHelper;
  AIRepositoryImpl(this.firestoreHelper);

  @override
  Future<Set<String>?> findAdjacentWords(String word) async {
    return firestoreHelper.findAdjacentWords(word);
  }

  @override
  Future<Set<String>> loadKillerWords() async {
    return firestoreHelper.loadKillerWords();
  }

  @override
  Future test(Set<String> words) async {
    return firestoreHelper.test(words);
  }

  @override
  Future<LastWord?> getLastWordInfo(String lastWord) async {
    return firestoreHelper.getLastWordInfo(lastWord);
  }
  // @override
  // Future<Set<int>?> getEdgeByWord(String word) async {}

  // @override
  // Future<int?> getIndexByWord(String word) async {}

  // @override
  // Future<String?> getWordByIndex(int index) async {}

  // @override
  // Future<Set<String>?> findKillerWords(Set<int> wordIndices) async {}

  // @override
  // Future<List<Set<int>>?> getEdgesByIndices(Set<int> indices) async {}

  // @override
  // Future<List<Map>?> getWordInfosByIndice(Set<int> indices) async {}
}
