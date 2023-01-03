import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/domain/model/game_log.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/user_information.dart';
import 'package:text_project/domain/model/word.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';

class FirestoreRepoImpl implements FirestoreRepo {
  final FirestoreHelper firestoreHelper;
  FirestoreRepoImpl(this.firestoreHelper);

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
  Future<void> sendGameLog(GameLog log) {
    return firestoreHelper.sendGameLog(log);
  }

  @override
  Future<void> updateUserStatAfterGame(GameLog log) {
    return firestoreHelper.updateUserInfoAfterGame(log);
  }

  @override
  Future<void> sendFeedback(String title, String content) async {
    return firestoreHelper.sendFeedback(title, content);
  }

  @override
  Future<List<GameLog>> fetchUserGameLogs(int limit) async {
    return firestoreHelper.fetchUserGameLogs(limit);
  }

  @override
  Future<UserInformation?> fetchUserInformation() async {
    return firestoreHelper.fetchUserInformation();
  }

  @override
  Future<Map<String, List<UserInformation>>> fetchTop5UserInformation() async {
    return firestoreHelper.fetchTop5UserInformation();
  }

  @override
  Future<void> updateDisplayName(String name) async {
    return firestoreHelper.updateDisplayName(name);
  }

  @override
  Future<List<String>> getDisplayNames(List<String> uids) async {
    return firestoreHelper.getDisplayNames(uids);
  }

  @override
  Future<bool> checkNameExists(String name) async {
    return firestoreHelper.checkNameExists(name);
  }
}
