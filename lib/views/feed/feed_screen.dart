import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/models/user.dart';
import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/view_models/feed/feed_item_view_model.dart';
import 'package:butterfly/view_models/feed/feed_list_view_model.dart';
import 'package:butterfly/view_models/feed/feed_view_model.dart';
import 'package:butterfly/view_models/user/user_view_model.dart';
import 'package:butterfly/views/feed/widgets/comment_screen.dart';
import 'package:butterfly/views/feed/widgets/profile_icon.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.createPost);
          },
          child: Icon(Icons.add),
          backgroundColor: BrandColors.blue,
          mini: true,
        ),
        body: SafeArea(
          child: _buildBody(context),
        ));
  }

  Widget _buildBody(context) {
    return Consumer<FeedViewModel>(
      builder: (context, feedViewModel, next) {
        return StreamBuilder<FeedListViewModel>(
          stream: feedViewModel.feedData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return _buildList(snapshot.data.feedList);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  Widget _buildList(List<FeedItemViewModel> feedList) {
    return ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
            onDoubleTap: () {
              feedList[index].supportPost();
              feedList[index].appreciatePost();
            },
            child: _buildListItem(context, feedList[index])),
        separatorBuilder: (context, index) => Divider(),
        itemCount: feedList.length);
  }

  Widget _buildListItem(context, FeedItemViewModel feedItem) {
    var supportStyle = feedItem.isSupported ? Colors.red : Colors.black;
    var appreciateStyle = feedItem.isAppreciated ? Colors.yellow : Colors.black;
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<UserViewModel>(builder: (context, user, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FutureBuilder<ButterflyUser>(
                  future: user.getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Row(
                          children: [
                            ProfileIcon(snapshot.data.name),
                            SizedBox(width: 6),
                            Text('Anonymous User'),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(feedItem.category),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: BrandColors.violet,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            );
          }),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              feedItem.title,
              style: BrandStyles.subtitleBold,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              feedItem.description,
              style: BrandStyles.subtitle,
            ),
          ),
          _activityOnPost(feedItem, supportStyle, appreciateStyle, context),
          Consumer<UserViewModel>(builder: (context, user, child) {
            final TextEditingController _commentController =
                new TextEditingController();
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FutureBuilder<ButterflyUser>(
                  future: user.getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                          snapshot.data.profilePictureUrl,
                          width: 32,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                SizedBox(width: 6),
                Container(
                  width: size.width * .7,
                  height: 30,
                  child: TextField(
                    controller: _commentController,
                    cursorColor: BrandColors.black,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          if (_commentController.text.isNotEmpty) {
                            feedItem.postComment(_commentController.text);
                            _commentController.text = "";
                            Fluttertoast.showToast(msg: "Comment Posted");
                          }
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: BorderSide(
                          color: BrandColors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: BorderSide(
                          color: BrandColors.black,
                          width: 1,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: BorderSide(
                          color: BrandColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }

  Row _activityOnPost(FeedItemViewModel feedItem, Color supportStyle,
      Color appreciateStyle, context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            feedItem.supportPost();
          },
          icon: Icon(
            feedItem.isSupported ? Icons.favorite : Icons.favorite_border,
            color: supportStyle,
          ),
        ),
        Text(
          '${feedItem.supportIdArray.length} Support',
          style: BrandStyles.subtitle,
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {
            feedItem.appreciatePost();
          },
          icon: Icon(
            feedItem.isAppreciated ? Icons.star : Icons.star_border,
            color: appreciateStyle,
          ),
        ),
        Text(
          '${feedItem.appreciateIdArray.length} Appreciate',
          style: BrandStyles.subtitle,
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => feedItem,
                  child: CommentScreen(),
                ),
              ),
            );
          },
          icon: Icon(
            Icons.comment_outlined,
          ),
        ),
      ],
    );
  }
}
