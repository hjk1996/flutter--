import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:text_project/domain/model/game_log.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/user_stat.dart';
import 'package:text_project/domain/model/word.dart';
import 'dart:math';

import 'package:text_project/presentation/game_screen/bl/robot_player.dart';

class FirestoreHelper {
  Future<Word> getWordInfo(String word) async {
    final wordInfo =
        await FirebaseFirestore.instance.collection('words').doc(word).get();
    return Word.fromJson(wordInfo.data()!);
  }

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

  Future<void> sendGameLog(Map<String, dynamic> log) async {
    await FirebaseFirestore.instance.collection('log').add(log);
  }

  Future<void> updateUserInfoAfterGame(Map<String, dynamic> log) async {
    final user = FirebaseAuth.instance.currentUser!;

    // update user's game count
    // create new document if document doesn't exist
    await FirebaseFirestore.instance.collection('userStat').doc(user.uid).set(
      {
        'gameCount': FieldValue.increment(1),
        'easyWinCount':
            log['difficulty'] == GameDifficulty.easy.name && log['win']
                ? FieldValue.increment(1)
                : FieldValue.increment(0),
        'normalWinCount':
            log['difficulty'] == GameDifficulty.normal.name && log['win']
                ? FieldValue.increment(1)
                : FieldValue.increment(0),
        'hardWinCount':
            log['difficulty'] == GameDifficulty.hard.name && log['win']
                ? FieldValue.increment(1)
                : FieldValue.increment(0),
        'impossibleWinCount':
            log['difficulty'] == GameDifficulty.impossible.name && log['win']
                ? FieldValue.increment(1)
                : FieldValue.increment(0),
        'lastGameAt': log['endAt'],
      },
      SetOptions(merge: true),
    );
  }

  Future<void> sendFeedback(String title, String content) async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'createdAt': DateTime.now().microsecondsSinceEpoch,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'title': title,
      'content': content
    });
  }

  // fetch user stat
  Future<UserStat?> fetchUserStat() async {
    final user = FirebaseAuth.instance.currentUser!;

    final stat = await FirebaseFirestore.instance
        .collection('userStat')
        .doc(user.uid)
        .get();

    if (stat.exists) {
      return UserStat.fromJson(stat.data()!);
    } else {
      return null;
    }
  }

  // fetch user game logs
  Future<List<GameLog>> fetchUserGameLogs(int limit) async {
    final logs = await FirebaseFirestore.instance
        .collection('log')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .limit(limit)
        .orderBy('endAt', descending: true)
        .get();

    return logs.docs.map((e) => GameLog.fromJson(e.data())).toList();
  }
}
