import 'package:butterfly/view_models/feed/feed_list_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedViewModel extends ChangeNotifier {
  Stream<FeedListViewModel> get feedData {
    return FirebaseFirestore.instance
        .collection('posts')
        .snapshots()
        .map((event) => FeedListViewModel.fromFirebase(event));
  }
}
