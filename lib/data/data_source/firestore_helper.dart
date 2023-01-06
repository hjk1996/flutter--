import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:text_project/domain/model/game_log.dart';
import 'package:text_project/domain/model/last_word.dart';
import 'package:text_project/domain/model/user_information.dart';
import 'package:text_project/domain/model/word.dart';
import 'dart:math';

import 'package:text_project/presentation/game_screen/bl/robot_player.dart';

class FirestoreHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Word> getWordInfo(String word) async {
    final wordInfo = await _firestore.collection('words').doc(word).get();
    return Word.fromJson(wordInfo.data()!);
  }

  Future<Set<String>?> findAdjacentWords(String word) async {
    final wordInfo = await _firestore.collection('words').doc(word).get();

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
      var wordInfo = await _firestore
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
    final lastWordInfo =
        await _firestore.collection('last_words').doc(lastWord).get();

    return LastWord.fromJson(lastWordInfo.data()!);
  }

  Future<Set<String>> loadKillerWords() async {
    final data = await _firestore.collection('utils').doc('killers').get();

    return Set.from(data.data()!['words']);
  }

  Future<Map<String, dynamic>> loadDooumMap() async {
    final data = await _firestore.collection('utils').doc('dooum').get();

    return data.data()!['map'];
  }

  Future<bool> checkWordExists(String word) async {
    final wordInfo = await _firestore.collection('words').doc(word).get();

    return wordInfo.exists ? true : false;
  }

  Future<void> sendGameLog(GameLog gameLog) async {
    await _firestore.collection('gameLogs').add(gameLog.toJson());
  }

  Future<void> updateDisplayName(String name) async {
    final user = _auth.currentUser!;
    await user.updateDisplayName(name);
    final uid = user.uid;
    await _firestore.collection('users').doc(uid).set(
      {
        'name': name,
      },
      SetOptions(merge: true),
    );
  }

  Future<String> getDisplayName(String uid) async {
    final data = await _firestore.collection('users').doc(uid).get();
    return data.data()!['name'];
  }

  Future<List<String>> getDisplayNames(List<String> uids) async {
    final data = await _firestore
        .collection('users')
        .where(FieldPath.documentId, whereIn: uids)
        .get();

    return data.docs.map((e) => e.data()['name'] as String).toList();
  }

  Future<void> updateUserInfoAfterGame(GameLog log) async {
    final user = _auth.currentUser!;

    // update user's game count
    // create new document if document doesn't exist

    await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
      {
        'gameCount': FieldValue.increment(1),
        'easyWinCount': log.difficulty == GameDifficulty.easy && log.win
            ? FieldValue.increment(1)
            : FieldValue.increment(0),
        'normalWinCount': log.difficulty == GameDifficulty.normal && log.win
            ? FieldValue.increment(1)
            : FieldValue.increment(0),
        'hardWinCount': log.difficulty == GameDifficulty.hard && log.win
            ? FieldValue.increment(1)
            : FieldValue.increment(0),
        'impossibleWinCount':
            log.difficulty == GameDifficulty.impossible && log.win
                ? FieldValue.increment(1)
                : FieldValue.increment(0),
        'lastGameAt': log.endAt.toIso8601String(),
      },
    );
  }

  Future<void> sendFeedback(String title, String content) async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'createdAt': DateTime.now().toIso8601String(),
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'title': title,
      'content': content
    });
  }

  // fetch user stat
  Future<UserInformation?> fetchUserInformation() async {
    final user = _auth.currentUser!;

    final stat = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (stat.exists) {
      return UserInformation.fromJson(stat.data()!);
    } else {
      return null;
    }
  }

  Future<Map<String, List<UserInformation>>> fetchTop5UserInformation() async {
    final firestore = FirebaseFirestore.instance;

    final easy5 = await firestore
        .collection('users')
        .orderBy('easyWinCount', descending: true)
        .limit(5)
        .get();

    final normal5 = await firestore
        .collection('users')
        .orderBy('normalWinCount', descending: true)
        .limit(5)
        .get();

    final hard10 = await firestore
        .collection('users')
        .orderBy('hardWinCount', descending: true)
        .limit(5)
        .get();

    final impossible10 = await firestore
        .collection('users')
        .orderBy('impossibleWinCount', descending: true)
        .limit(5)
        .get();

    return {
      'easy':
          easy5.docs.map((e) => UserInformation.fromJson(e.data())).toList(),
      'normal':
          normal5.docs.map((e) => UserInformation.fromJson(e.data())).toList(),
      'hard':
          hard10.docs.map((e) => UserInformation.fromJson(e.data())).toList(),
      'impossible': impossible10.docs
          .map((e) => UserInformation.fromJson(e.data()))
          .toList(),
    };
  }

  // fetch user game logs
  Future<List<GameLog>> fetchUserGameLogs(int limit) async {
    final logs = await FirebaseFirestore.instance
        .collection('gameLogs')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .limit(limit)
        .orderBy('endAt', descending: true)
        .get();

    return logs.docs.map((e) => GameLog.fromJson(e.data())).toList();
  }

  Future<bool> checkNameExists(String name) async {
    if (_auth.currentUser == null) return false;
    if (_auth.currentUser!.displayName == name) return false;

    final users = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: name)
        .get();

    return users.docs.isNotEmpty;
  }
}
