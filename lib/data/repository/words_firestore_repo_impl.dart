import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/word.dart';
import 'package:text_project/domain/repository/words_repo.dart';

class WordsFirestoreRepoImpl implements WordsRepo {
  final FirestoreHelper firestoreHelper;
  WordsFirestoreRepoImpl(this.firestoreHelper);

  // TODO: 
  // 이거 어떻게 싱글톤으로 만들건지 고민
  // 단어 저장할 때 firebase에 접근해야함.
  @override
  Future<Word> getWordInfo(String word) async {
    return firestoreHelper.getWordInfo(word);
  }

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

  @override
  Future<void> sendGameLog(Map<String, dynamic> log) {
    return firestoreHelper.sendGameLog(log);
  }
}
