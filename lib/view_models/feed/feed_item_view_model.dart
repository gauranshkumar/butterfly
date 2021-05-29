import 'package:butterfly/models/analysis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:butterfly/models/post.dart';

class FeedItemViewModel extends ChangeNotifier {
  Post _post;
  String uid;
  String title;
  String description;
  String category;
  List<String> supportIdArray;
  List<String> appreciateIdArray;
  List<String> comments;
  String authorId;
  bool get isSupported =>
      supportIdArray.contains(FirebaseAuth.instance.currentUser.uid);

  bool get isAppreciated =>
      appreciateIdArray.contains(FirebaseAuth.instance.currentUser.uid);

  FeedItemViewModel({
    this.uid = '',
    this.title = '',
    this.description = '',
    this.category = '',
    this.supportIdArray = const [],
    this.appreciateIdArray = const [],
    this.comments = const [],
    this.authorId = '',
  });

  factory FeedItemViewModel.fromFirebase(
      QueryDocumentSnapshot documentSnapshot) {
    Post post = Post.fromFirebase(documentSnapshot);
    return FeedItemViewModel(
      authorId: post.authorId,
      appreciateIdArray: post.appreciateIdArray,
      supportIdArray: post.supportIdArray,
      title: post.title,
      comments: post.comments,
      category: post.category,
      uid: post.uid,
      description: post.description,
    );
  }

  void supportPost() {
    if (supportIdArray.contains(FirebaseAuth.instance.currentUser.uid)) {
      FirebaseFirestore.instance.collection('posts').doc(uid).update({
        'supportIdArray': FieldValue.arrayRemove(
          [FirebaseAuth.instance.currentUser.uid],
        )
      });
    } else {
      FirebaseFirestore.instance.collection('posts').doc(uid).update({
        'supportIdArray': FieldValue.arrayUnion(
          [FirebaseAuth.instance.currentUser.uid],
        )
      });
    }
  }

  void appreciatePost() {
    if (appreciateIdArray.contains(FirebaseAuth.instance.currentUser.uid)) {
      FirebaseFirestore.instance.collection('posts').doc(uid).update({
        'appreciateIdArray': FieldValue.arrayRemove(
          [FirebaseAuth.instance.currentUser.uid],
        )
      });
    } else {
      FirebaseFirestore.instance.collection('posts').doc(uid).update({
        'appreciateIdArray': FieldValue.arrayUnion(
          [FirebaseAuth.instance.currentUser.uid],
        )
      });
    }
  }

  void postComment(String text) {
    FirebaseFirestore.instance.collection('posts').doc(uid).update({
      'comments': FieldValue.arrayUnion([text])
    });
    final analysisData = Analysis.fromText(text);
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({
      'rewardCoins': FieldValue.increment(analysisData.score),
    });
    notifyListeners();
  }
}
