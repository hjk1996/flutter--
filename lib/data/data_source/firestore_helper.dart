import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  Future<Set<String>?> findAdjacentWords(String word) async {
    final wordInfo =
        await FirebaseFirestore.instance.collection('words').doc(word).get();

    if (!wordInfo.exists) {
      return null;
    }

    final Map<String, dynamic>? wordInfoData = wordInfo.data();
    final List<dynamic> adjWords = wordInfoData!['adjacent_words'];

    if (adjWords.length == 0) {
      return null;
    }

    return Set.from(adjWords);
  }

  Future loadKillWords() async {}
}
