import 'package:butterfly/config/colors.dart';
import 'package:butterfly/routes/route_names.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.createPost);
        },
        child: Icon(Icons.add),
        backgroundColor: BrandColors.blue,
        mini: true,
      ),
      body: Center(
        child: Text("Feed"),
      ),
    );
  }
}
