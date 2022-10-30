import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> checkWordDBExists() async {
  final directory = await getApplicationDocumentsDirectory();
  final dbPath = join(directory.path, 'word_db.db');
  return databaseExists(dbPath);
}

