import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/view_models/feed/feed_item_view_model.dart';
import 'package:butterfly/views/feed/widgets/profile_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FeedItemViewModel feedItemViewModel =
        Provider.of<FeedItemViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: BrandColors.black),
        title: Text(
          'Comments',
          style: BrandStyles.bodyRegular,
        ),
        centerTitle: true,
      ),
      body: _buildBody(feedItemViewModel),
    );
  }

  Widget _buildBody(FeedItemViewModel feedItemViewModel) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 6),
                ProfileIcon('A'),
                SizedBox(width: 6),
                Text(
                  feedItemViewModel.comments[index],
                  style: BrandStyles.subtitle,
                ),
                Spacer(),
                Icon(
                  Icons.thumb_up_alt_rounded,
                  color: BrandColors.black,
                  size: 20,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: feedItemViewModel.comments.length);
  }
}
