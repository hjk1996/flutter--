import 'package:text_project/domain/model/last_word.dart';

abstract class WordsRepo {
  Future<Set<String>?> findAdjacentWords(String word);

  Future<Set<String>> loadKillerWords();

  Future<Map<String, dynamic>> loadDooumMap();

  Future<LastWord> getLastWordInfo(String lastWord);

  Future<String> getRandomNonKillerWord();
  Future<bool> checkWordExists(String word);
}
