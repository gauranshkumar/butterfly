import 'package:butterfly/config/styles.dart';
import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BrandStyles.themeData,
      initialRoute: _getInitialRoute(),
      onGenerateRoute: Routes.onGenerateRoute,
      onUnknownRoute: Routes.onUnknownRoute,
    );
  }

  String _getInitialRoute() {
    if (FirebaseAuth.instance.currentUser != null) {
      return RouteNames.homePage;
    }
    return RouteNames.loginPage;
  }
}
