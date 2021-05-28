import 'dart:async';

import 'package:butterfly/models/user.dart';
import 'package:butterfly/services/login_sevice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  LoginService _loginService = LoginService();
  Future<bool> login() async {
    final isLoggedIn = await _loginService.login();
    return isLoggedIn;
  }
}
