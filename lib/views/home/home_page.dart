import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("Hello"),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    BrandIcons.award,
                    color: BrandColors.blue,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
