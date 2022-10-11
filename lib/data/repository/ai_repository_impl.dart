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
  Future<int?> getIndexByWord(String word) async {
    return dbHelper.getIndexByWord(word);
  }

  @override
  Future<String?> getWordByIndex(int index) async {
    return dbHelper.getWordByIndex(index);
  }

  @override
  Future<Set<int>?> findKillerWordIndices(Set<int> wordIndices) async {
    return dbHelper.findKillerWordIndices(wordIndices);
  }

  @override
  Future<List<Set<int>>?> getEdgesByIndices(Set<int> indices) async {
    return dbHelper.getEdgesByIndices(indices);
  }

  @override
  Future<List<Map>?> getWordInfosByIndices(Set<int> indices) async {
    return dbHelper.getWordInfosByIndices(indices);
  }

  @override
  Future<Set<int>> loadAllKillerWordIndices() async {
    return dbHelper.loadAllKillerWordIndices();
  }
}
