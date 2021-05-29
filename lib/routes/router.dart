import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/view_models/album_page/album_page_model.dart';
import 'package:butterfly/view_models/login/login_view_model.dart';
import 'package:butterfly/view_models/new_post/create_post_view_model.dart';
import 'package:butterfly/views/home/home_page.dart';
import 'package:butterfly/views/login/login_page.dart';
import 'package:butterfly/views/music/album_screen.dart';
import 'package:butterfly/views/new_post/create_post.dart';
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
    switch (settings.name) {
      case RouteNames.homePage:
        return CustomRoute<bool>(builder: (BuildContext context) => HomePage());
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
