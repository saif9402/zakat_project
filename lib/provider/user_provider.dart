import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../database_utils.dart';
import 'my_user.dart';

class UserProvider extends ChangeNotifier {
  MyUser? user;
  User? firebaseUser;

  UserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    initMyUser();
  }

  void initMyUser() async {
    if (firebaseUser != null) {
      user = await DataBaseUtils.readUser(firebaseUser?.uid ?? "");
      notifyListeners();
    }
  }

}
