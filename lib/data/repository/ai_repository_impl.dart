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
  Future<LastWord> getLastWordInfo(String lastWord) async {
    return firestoreHelper.getLastWordInfo(lastWord);
  }

  @override
  Future<String> getRandomNonKillerWord() async {
    return firestoreHelper.getRandomNonKillerWord();
  }
}
