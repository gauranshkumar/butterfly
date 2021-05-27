import 'package:butterfly/config/styles.dart';
import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BrandStyles.themeData,
      initialRoute: RouteNames.homePage,
      onGenerateRoute: Routes.onGenerateRoute,
      onUnknownRoute: Routes.onUnknownRoute,
    );
  }
}
