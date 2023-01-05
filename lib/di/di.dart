import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/data/data_source/storage_helper.dart';
import 'package:text_project/data/repository/storage_repo_impl.dart';
import 'package:text_project/data/repository/firestore_repo_impl.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';
import 'package:text_project/presentation/game_screen/bl/player_abc.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> initialSetUp() async {
  final getIt = GetIt.instance;
  getIt.registerSingleton<FirestoreRepo>(FirestoreRepoImpl(FirestoreHelper()));
  getIt.registerSingleton<FirebaseStorageRepo>(
      FirebaseStorageRepoImpl(helper: FirebaseStorageHelper()));
  getIt.registerSingleton(Referee(repo: getIt<FirestoreRepo>()));
  getIt.registerSingleton(Connectivity());
  getIt.registerSingleton(await SharedPreferences.getInstance());
}

RobotPlayerABC makeBot(GameDifficulty difficulty, Referee referee) {
  final getIt = GetIt.instance;
  return RobotPlayer(
      difficulty: difficulty,
      referee: getIt<Referee>(),
      wordsRepo: getIt<FirestoreRepo>());
}

// List<ChangeNotifierProvider> getProviders() {
//   return [
//     ChangeNotifierProvider(create: (context) => AuthScreenViewModel()),
//     ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
//     ChangeNotifierProvider(create: (context) => NoteScreenViewModel()),
//     ChangeNotifierProvider(
//       create: (context) => GameScreenViewModel(
//         referee: GetIt.instance<Referee>(),
//       ),
//     ),
//     ChangeNotifierProvider(
//         create: (context) => UserScreenViewModel(
//               repo: GetIt.instance<FirebaseStorageRepo>(),
//             )),
//   ];
// }
