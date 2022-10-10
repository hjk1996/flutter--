import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:text_project/data/data_source/db_helper.dart';
import 'package:text_project/data/repository/ai_repository_impl.dart';
import 'package:text_project/domain/repository/ai_repository.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

Future<Database> getDB() async {
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, '~www/word_db.db');
  var exists = await databaseExists(path);

  if (!exists) {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    var data = await rootBundle.load(join('assets', 'word_data.db'));
    List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );

    await File(path).writeAsBytes(bytes, flush: true);
  }

  return await openDatabase(path);
}

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await getDB();
  DBHelper dbHelper = DBHelper(database: database);
  AIRepository aiRepository = AIRepositoryImpl(dbHelper);

  return [
    ChangeNotifierProvider(create: (context) => GameScreenViewModel()),
  ];
}
