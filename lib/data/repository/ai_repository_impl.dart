import 'package:text_project/data/data_source/db_helper.dart';
import 'package:text_project/domain/repository/ai_repository.dart';

class AIRepositoryImpl implements AIRepository {
  final DBHelper dbHelper;
  AIRepositoryImpl(this.dbHelper);

  @override
  Future<Set<int>?> getEdgeByWord(String word) async {
    return dbHelper.getEdgeByWord(word);
  }

  @override
  Future<int?> getWordIndexByWord(String word) async {
    return dbHelper.getWordIndexByWord(word);
  }

  @override
  Future<Set<int>?> findKillerWordIndices(Set<int> wordIndices) {
    return dbHelper.findKillerWordIndices(wordIndices);
  }

  @override
  Future<List<Set<int>>?> getEdgesByIndices(Set<int> indices) {
    return dbHelper.getEdgesByIndices(indices);
  }

  @override
  Future<List<Map>?> getWordInfosByIndices(Set<int> indices) {
    return dbHelper.getWordInfosByIndices(indices);
  }
}
