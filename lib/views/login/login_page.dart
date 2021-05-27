import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/view_models/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({this.loginViewModel});

  final LoginViewModel loginViewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _getLoginView(context)),
    );
  }

  Widget _getLoginView(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/login.png',
          width: 458,
        ),
        OutlinedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 64, vertical: 10)),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: BrandColors.black),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  ContinuousRectangleBorder(side: BorderSide.none))),
          onPressed: () async {
            final isLoggedIn = await loginViewModel.login();
            if (isLoggedIn) {
              Navigator.pushReplacementNamed(context, RouteNames.homePage);
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('images/google.svg'),
              SizedBox(width: 10),
              Text(
                "Sign in",
                style: BrandStyles.headingBold.copyWith(
                  fontSize: 20,
                  color: BrandColors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
