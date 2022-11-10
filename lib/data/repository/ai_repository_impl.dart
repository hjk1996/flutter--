import 'package:text_project/data/data_source/db_helper.dart';
import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/domain/repository/ai_repository.dart';

class AIRepositoryImpl implements AIRepository {
  final FirestoreHelper firestoreHelper;
  AIRepositoryImpl(this.firestoreHelper);

  Future<Set<String>?> findAdjacentWords(String word) async {
    return firestoreHelper.findAdjacentWords(word);
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
