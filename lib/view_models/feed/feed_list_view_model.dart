import 'package:butterfly/view_models/feed/feed_item_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FeedListViewModel extends ChangeNotifier {
  List<FeedItemViewModel> feedList;
  FeedListViewModel({this.feedList});
  factory FeedListViewModel.fromFirebase(QuerySnapshot querySnapshot) {
    final feedItemList = querySnapshot.docs
        .map((e) => FeedItemViewModel.fromFirebase(e))
        .toList();
    return FeedListViewModel(feedList: feedItemList);
  }
}
