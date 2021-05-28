import 'package:butterfly/models/post.dart';
import 'package:butterfly/models/tag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CreatePostViewModel extends ChangeNotifier {
  void updateTag(Tag tag) {
    kQuestionTags = kQuestionTags.map((e) {
      if (e.title == tag.title) {
        e.isSelected = !e.isSelected;
      } else {
        e.isSelected = false;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  String get currentTagTitle =>
      kQuestionTags.where((element) => element.isSelected != false).first.title;
  bool postQuestion(Post post) {
    final docRef = FirebaseFirestore.instance
        .collection('posts')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('my-posts')
        .doc()
        .set(post.toMap());
    return docRef != null;
  }
}
