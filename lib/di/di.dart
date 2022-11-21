import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/data/repository/words_firestore_repo_impl.dart';
import 'package:text_project/domain/repository/words_repo.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/bl/robot_expert.dart';
import 'package:text_project/presentation/game_screen/bl/player_abc.dart';




Referee makeRefree() {
  final firestoreHelper = FirestoreHelper();
  WordsRepo wordsRepo = WordsFirestoreRepoImpl(firestoreHelper);
  return Referee(firebaseRepo: wordsRepo);
}

RobotPlayerABC makeExpertBot(Referee referee) {
  final firestoreHelper = FirestoreHelper();
  WordsRepo wordsRepo = WordsFirestoreRepoImpl(firestoreHelper);
  return RobotExpert(referee: referee, wordsRepo: wordsRepo);
}
