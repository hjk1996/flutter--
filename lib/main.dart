import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/common/theme.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_mode.dart';
import 'package:text_project/presentation/initial_screen/initial_screen_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(androidDebugProvider: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthScreenViewModel()),
        ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (context) => GameScreenViewModel())
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Relay App',
      theme: AppTheme().dark,
      home: const InitialScreenView(),
    );
  }
}
