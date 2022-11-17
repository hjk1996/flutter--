import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_project/domain/model/last_word.dart';

abstract class AIRepository {
  Future<Set<String>?> findAdjacentWords(String word);

  Future<Set<String>> loadKillerWords();

  Future<LastWord> getLastWordInfo(String lastWord);

  Future<String> getRandomNonKillerWord();
}
