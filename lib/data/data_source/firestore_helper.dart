import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/word.dart';

class FirestoreHelper {
  Future<Set<String>?> findAdjacentWords(String word) async {
    try {
      final wordInfo =
          await FirebaseFirestore.instance.collection('words').doc(word).get();

      // 단어가 존재하지 않는 경우 null을 반환
      if (!wordInfo.exists) {
        return null;
      }

      final Word wordData = Word.fromJson(wordInfo.data()!);

      // 단어가 존재하지만 인접 단어가 없는 경우 빈 set를 반환
      if (wordData.adjacentWords.isEmpty) {
        return Set();
      }

      return Set.from(wordData.adjacentWords);
    } on FirebaseException catch (err) {
      rethrow;
    } on Exception catch (err) {
      rethrow;
    }
  }

  Future<LastWord?> getLastWordInfo(String lastWord) async {
    try {
      final lastWordInfo = await FirebaseFirestore.instance
          .collection('last_words')
          .doc(lastWord)
          .get();

      if (!lastWordInfo.exists) {
        return null;
      }

      return LastWord.fromJson(lastWordInfo.data()!);
    } on FirebaseException catch (err) {}
  }

  Future test(Set<String> words) async {
    print(List.from(words));
    await FirebaseFirestore.instance
        .collection('words')
        .where('id', whereIn: List.from(words))
        .get();
  }

  Future<Set<String>> loadKillerWords() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('words')
          .doc('killers')
          .get();

      return Set.from(data.data()!['list']);
    } on FirebaseException catch (err) {
      rethrow;
    } on Exception catch (err) {
      rethrow;
    }
  }
}
