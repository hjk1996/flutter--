import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database database;
  DBHelper({required this.database});

  // 단어를 통해 엣지를 찾음
  Future<Set<int>?> getEdgeByWord(String word) async {
    final edge = await database.query(
      'word_table',
      columns: ['edge'],
      where: 'word= ?',
      whereArgs: [word],
    );

    if (edge.isEmpty) {
      return null;
    }

    return Set.from(jsonDecode(edge.first['edge'] as String));
  }

  Future<Set<int>?> getEdgeByIndex(int index) async {
    final edge = await database.query(
      'word_table',
      columns: ['edge'],
      where: 'word_index = ?',
      whereArgs: [index],
    );

    if (edge.isEmpty) {
      return null;
    }

    return Set.from(jsonDecode(edge.first['edge'] as String));
  }

  Future<List<Set<int>>?> getEdgesByIndices(Set<int> indices) async {
    final edges = await database.query(
      'word_table',
      columns: ['edge'],
      where: 'word_index = (${('?' * (indices.length)).split('').join(', ')})',
      whereArgs: [...indices],
    );

    if (edges.isEmpty) return null;

    return edges
        .map((e) => Set.from(jsonDecode(e['edge'] as String)) as Set<int>)
        .toList();
  }

  Future<List<Map>?> getWordInfosByIndice(Set<int> indices) async {
    final wordInfos = await database.query('word_table',
        where:
            'word_index = (${('?' * (indices.length)).split('').join(', ')})',
        whereArgs: [...indices],
        orderBy: 'word_index');

    if (wordInfos.isEmpty) return null;

    return wordInfos;
  }

  // 단어를 통해 단어의 인덱스를 찾음
  Future<int?> getIndexByWord(String word) async {
    final wordIndex = await database.query(
      'word_table',
      columns: ['word_table'],
      where: 'word = ?',
      whereArgs: [word],
    );

    if (wordIndex.isNotEmpty) {
      return wordIndex.first['word_index'] as int;
    } else {
      return null;
    }
  }

  // 인덱스를 톻해 단어를 찾음
  Future<String?> getWordByIndex(int index) async {
    final word = await database.query(
      'word',
      columns: ['word_table'],
      where: 'word_index = ?',
      whereArgs: [index],
    );

    if (word.isNotEmpty) {
      return word.first['word'] as String;
    } else {
      return null;
    }
  }

  Future<Set<int>> loadAllKillerWordIndice() async {
    return database
        .query('word_table',
            columns: ['word_index'],
            where: 'is_killer_word = ?',
            whereArgs: [1])
        .then(
          (list) => list.map((e) => e['word_index'] as int).toSet(),
        );
  }

  // 단어의 인덱스를 가지고 한방단어로 이어질 수 있는 단어의 인덱스들을 찾음
  Future<Set<String>?> findKillerWords(Set<int> indice) async {
    final killerWordIndices = await database.query('word_table',
        columns: ['word'],
        where:
            'is_killer_word = ? AND word_index IN (${('?' * (indice.length)).split('').join(', ')})',
        whereArgs: [1, ...indice.toList()]);

    if (killerWordIndices.isNotEmpty) {
      return Set.from(killerWordIndices.map((e) => e['word']));
    } else {
      return null;
    }
  }

  Future<void> closeDB() async {
    await database.close();
  }

  // 단어의 인덱스를 가지고 한방단어로 이어지지 않는 안전한 단어들의 인덱스를 찾음.
  // Future<Set<int>?> findSafeWordIndices(Set<int> wordIndices) async {
  //   var possibleMoves = await database.query(
  //     'word_table',
  //     columns: ['edge'],
  //     where:
  //         'word_index IN (${('?' * (wordIndices.length)).split('').join(', ')})',
  //     whereArgs: wordIndices.toList(),
  //   );

  //   // List<String>
  //   if (possibleMoves.isEmpty) {
  //     return null;
  //   } else {
  //     final possibleMoveSets = possibleMoves
  //         .map(
  //           (object) => Set.from(
  //             jsonDecode(
  //               object['edge'] as String,
  //             ),
  //           ),
  //         )
  //         .toList();

  //     final possibleMoveSet =
  //         possibleMoveSets.reduce((value, element) => value.union(element));
  //   }
  // }
}
