import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Book a session",
          style: BrandStyles.bodyRegular,
        ),
        iconTheme: IconThemeData(color: BrandColors.black),
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "Feature coming soon... stay tuned");
            },
            icon: Icon(
              Icons.share,
              size: 24,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Feature coming soon...",
          style: BrandStyles.headingBold,
        ),
      ),
    );
  }
}
