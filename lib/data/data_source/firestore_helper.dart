import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/word.dart';
import 'dart:math';

class FirestoreHelper {
  Future<Set<String>?> findAdjacentWords(String word) async {
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
  }

  Future<String> getRandomNonKillerWord() async {
    while (true) {
      var randomIdx = Random().nextInt(87590);
      var wordInfo = await FirebaseFirestore.instance
          .collection('words')
          .where('killer', isEqualTo: false)
          .where('id', isEqualTo: randomIdx)
          .get();

      if (wordInfo.docs.isNotEmpty) {
        return wordInfo.docs.first.id;
      }
    }
  }

  Future<LastWord> getLastWordInfo(String lastWord) async {
    final lastWordInfo = await FirebaseFirestore.instance
        .collection('last_words')
        .doc(lastWord)
        .get();

    return LastWord.fromJson(lastWordInfo.data()!);
  }

  Future<Set<String>> loadKillerWords() async {
    final data = await FirebaseFirestore.instance
        .collection('utils')
        .doc('killers')
        .get();

    return Set.from(data.data()!['words']);
  }

  Future<Map<String, dynamic>> loadDooumMap() async {
    final data =
        await FirebaseFirestore.instance.collection('utils').doc('dooum').get();

    return data.data()!['map'];
  }

  Future<bool> checkWordExists(String word) async {
    final wordInfo =
        await FirebaseFirestore.instance.collection('words').doc(word).get();

    return wordInfo.exists ? true : false;
  }
}
