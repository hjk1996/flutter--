import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserScreenViewModel with ChangeNotifier {
  Future<void> getUserProfileImage() async {

    
    FirebaseAuth.instance.currentUser!.photoURL;
  }
}
