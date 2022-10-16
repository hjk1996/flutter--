import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/di/provider_setting.dart';
import 'package:text_project/presentation/game_screen/game_screen_view.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';
import 'package:text_project/presentation/initial_screen/initial_screen_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final providers = await getProviders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 24))),
      home: InitialScreenView(),
    );
  }
}
