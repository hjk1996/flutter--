import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/word.dart';

abstract class FirestoreRepo {
  Future<Word> getWordInfo(String word);
  Future<Set<String>?> findAdjacentWords(String word);
  Future<Set<String>> loadKillerWords();
  Future<Map<String, dynamic>> loadDooumMap();
  Future<LastWord> getLastWordInfo(String lastWord);
  Future<String> getRandomNonKillerWord();
  Future<bool> checkWordExists(String word);
  Future<void> sendGameLog(Map<String, dynamic> log);
  Future<void> sendFeedback(String title, String content);
}
