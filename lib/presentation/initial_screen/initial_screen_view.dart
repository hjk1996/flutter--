import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';

class InitialScreenView extends StatelessWidget {
  const InitialScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return const AuthScreenView();
    } else {
      return const HomeScreenView();
    }
  }
}
