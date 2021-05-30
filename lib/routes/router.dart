import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/view_models/feed/comment_view_model.dart';
import 'package:butterfly/view_models/feed/feed_item_view_model.dart';
import 'package:butterfly/view_models/feed/feed_list_view_model.dart';
import 'package:butterfly/view_models/feed/feed_view_model.dart';
import 'package:butterfly/view_models/album_page/album_page_model.dart';
import 'package:butterfly/view_models/login/login_view_model.dart';
import 'package:butterfly/view_models/new_post/create_post_view_model.dart';
import 'package:butterfly/view_models/user/user_view_model.dart';
import 'package:butterfly/views/feed/widgets/comment_screen.dart';
import 'package:butterfly/views/home/home_page.dart';
import 'package:butterfly/views/login/login_page.dart';
import 'package:butterfly/views/music/album_screen.dart';
import 'package:butterfly/views/new_post/create_post.dart';
import 'package:butterfly/views/psy_tests/take_test.dart';
import 'package:butterfly/views/sessions/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_route.dart';

class Routes {
  // static dynamic route() {
  //   return {
  //     splash: (BuildContext context) => SplashScreen(),
  //   };
  // }

  static Route onGenerateRoute(RouteSettings settings) {
    final feedItemViewModel = FeedItemViewModel();
    final userViewModel = UserViewModel();
    var feedListViewModel = FeedListViewModel();
    switch (settings.name) {
      case RouteNames.homePage:
        return CustomRoute<bool>(builder: (BuildContext context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => FeedViewModel()),
              ChangeNotifierProvider(create: (context) => feedListViewModel),
              ChangeNotifierProvider(create: (context) => feedItemViewModel),
              ChangeNotifierProvider(create: (context) => userViewModel),
              ChangeNotifierProvider(create: (context) => AlbumViewModel()),
            ],
            child: HomePage(),
          );
        });
      case RouteNames.loginPage:
        return CustomRoute<bool>(
          builder: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => LoginViewModel(),
            child: LoginPage(
              loginViewModel: LoginViewModel(),
            ),
          ),
        );
      case RouteNames.createPost:
        return CustomRoute<bool>(
          builder: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => CreatePostViewModel(),
            child: CreatePostPage(),
          ),
        );
      case RouteNames.albumPage:
        return CustomRoute<bool>(
          builder: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => AlbumViewModel(),
            child: AlbumScreen(),
          ),
        );
      case RouteNames.commentPage:
        return CustomRoute<bool>(
          builder: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => feedItemViewModel,
            child: CommentScreen(),
          ),
        );
      case RouteNames.takeTest:
        return CustomRoute<bool>(builder: (BuildContext context) => TakeTest());
      case RouteNames.bookingScreen:
        return CustomRoute<bool>(
            builder: (BuildContext context) => BookingScreen());
      default:
        return onUnknownRoute(const RouteSettings(name: '/invalid'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(settings.name.split('/')[1]),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name} Comming soon..'),
        ),
      ),
    );
  }
}
