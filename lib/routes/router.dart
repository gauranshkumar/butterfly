import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/views/home/home_page.dart';
import 'package:flutter/material.dart';

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
