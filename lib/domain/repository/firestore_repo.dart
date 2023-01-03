import 'package:text_project/domain/model/game_log.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/user_information.dart';
import 'package:text_project/domain/model/word.dart';

abstract class FirestoreRepo {
  Future<Word> getWordInfo(String word);
  Future<Set<String>?> findAdjacentWords(String word);
  Future<Set<String>> loadKillerWords();
  Future<Map<String, dynamic>> loadDooumMap();
  Future<LastWord> getLastWordInfo(String lastWord);
  Future<String> getRandomNonKillerWord();
  Future<bool> checkWordExists(String word);
  Future<void> sendGameLog(GameLog log);
  Future<void> updateDisplayName(String name);
  Future<void> updateUserStatAfterGame(GameLog log);
  Future<void> sendFeedback(String title, String content);
  Future<List<GameLog>> fetchUserGameLogs(int limit);
  Future<UserInformation?> fetchUserInformation();
  Future<Map<String, List<UserInformation>>> fetchTop5UserInformation();
  Future<List<String>> getDisplayNames(List<String> uids);
  Future<bool> checkNameExists(String name);
}
