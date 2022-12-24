import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:text_project/di/di.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/common/theme.dart';
import 'package:text_project/presentation/feedback_screen/feedback_screen_view_model.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:text_project/presentation/note_screen/note_screen_view_model.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';
import 'firebase_options.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialSetUp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(androidDebugProvider: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthScreenViewModel(
            repo: GetIt.instance<FirebaseStorageRepo>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (context) => NoteScreenViewModel()),
        ChangeNotifierProvider(
          create: (context) => GameScreenViewModel(
            referee: GetIt.instance<Referee>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedbackScreenViewModel(
            firestoreRepo: GetIt.instance<FirestoreRepo>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => UserScreenViewModel(
            repo: GetIt.instance<FirebaseStorageRepo>(),
          ),
        ),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Relay Game',
      theme: AppTheme().dark,
      home: Builder(
        builder: (context) {
          if (FirebaseAuth.instance.currentUser == null) {
            return const AuthScreenView();
          } else {
            return const HomeScreenView();
          }
        },
      ),
    );
  }
}
