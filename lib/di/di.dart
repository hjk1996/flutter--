import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/data/repository/words_firestore_repo_impl.dart';
import 'package:text_project/domain/repository/words_repo.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/bl/robot_expert.dart';
import 'package:text_project/presentation/game_screen/bl/player_abc.dart';
import 'package:get_it/get_it.dart';

void initialSetUp() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<WordsRepo>(WordsFirestoreRepoImpl(FirestoreHelper()));
  getIt.registerSingleton(Referee(wordsRepo: getIt<WordsRepo>()));
}

RobotPlayerABC makeExpertBot(Referee referee) {
  final getIt = GetIt.instance;
  return RobotExpert(referee: getIt<Referee>(), wordsRepo: getIt<WordsRepo>());
}
