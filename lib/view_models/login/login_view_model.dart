import 'dart:async';

import 'package:butterfly/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  FirebaseService _firebaseService = FirebaseService();
  Future<bool> login() async {
    final isLoggedIn = await _firebaseService.login();
    return isLoggedIn;
  }

  User get user => FirebaseAuth.instance.currentUser;
}
