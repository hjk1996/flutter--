import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:text_project/data/data_source/db_helper.dart';
import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/data/exceptions.dart';
import 'package:text_project/data/repository/ai_repository_impl.dart';
import 'package:text_project/domain/repository/ai_repository.dart';
import 'package:text_project/presentation/game_screen/ai_player.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_project/utils.dart';

GameScreenViewModel makeGameScreenViewModel() {
  final firestoreHelper = FirestoreHelper();
  AIRepository aiRepository = AIRepositoryImpl(firestoreHelper);
  AIPlayer aiPlayer = AIPlayer(aiRepository: aiRepository);
  aiPlayer.startGame();
  return GameScreenViewModel(aiPlayer: aiPlayer);
}
