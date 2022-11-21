import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/repository/words_repo.dart';

class WordsFirestoreRepoImpl implements WordsRepo {
  final FirestoreHelper firestoreHelper;
  WordsFirestoreRepoImpl(this.firestoreHelper);

  @override
  Future<Set<String>?> findAdjacentWords(String word) async {
    return firestoreHelper.findAdjacentWords(word);
  }

  @override
  Future<Set<String>> loadKillerWords() async {
    return firestoreHelper.loadKillerWords();
  }

  @override
  Future<Map<String, dynamic>> loadDooumMap() async {
    return firestoreHelper.loadDooumMap();
  }

  @override
  Future<LastWord> getLastWordInfo(String lastWord) async {
    return firestoreHelper.getLastWordInfo(lastWord);
  }

  @override
  Future<String> getRandomNonKillerWord() async {
    return firestoreHelper.getRandomNonKillerWord();
  }

  @override
  Future<bool> checkWordExists(String word) async {
    return firestoreHelper.checkWordExists(word);
  }
}
