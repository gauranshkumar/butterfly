import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String name;
  ProfileIcon(this.name);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: 30,
          height: 30,
          color: BrandColors.grey,
          child: Center(
            child: Text(
              name[0],
              style: BrandStyles.subtitleBold,
            ),
          ),
        ));
  }
}
