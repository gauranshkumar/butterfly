import 'package:butterfly/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  Future<ButterflyUser> getUser() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then<ButterflyUser>((value) => ButterflyUser.fromMap(value.data()));
  }
}
