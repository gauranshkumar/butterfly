import 'package:butterfly/view_models/feed/feed_item_view_model.dart';
import 'package:flutter/cupertino.dart';

class CommentViewModel extends ChangeNotifier {
  FeedItemViewModel feedItemViewModel;
  CommentViewModel({this.feedItemViewModel});
}
