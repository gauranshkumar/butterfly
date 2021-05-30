import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/models/user.dart';
import 'package:butterfly/view_models/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ButterflyUser>(
      future: Provider.of<UserViewModel>(context).getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    snapshot.data.profilePictureUrl,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                snapshot.data.name,
                style: BrandStyles.subtitleBold,
              ),
              SizedBox(height: 8),
              Container(
                width: 150,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                    color: BrandColors.lightOrange,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: BrandColors.yellow,
                      width: 1.5,
                    )),
                child: Center(
                  child: Text(
                    '\$ ${snapshot.data.rewardCoins.toString()} Coins',
                    style: BrandStyles.subtitleBold
                        .copyWith(color: BrandColors.black),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 12),
                    Text(
                      'Name',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: BrandColors.black,
                      ),
                    ),
                    Spacer(),
                    Text(snapshot.data.name,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: BrandColors.black,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(width: 12),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 12),
                    Text(
                      'Email',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: BrandColors.black,
                      ),
                    ),
                    Spacer(),
                    Text(snapshot.data.email,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: BrandColors.black,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(width: 12),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 12),
                    Text(
                      'Location',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: BrandColors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Delhi',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: BrandColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
              Spacer(),
              OutlinedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: BrandColors.blue),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        ContinuousRectangleBorder(side: BorderSide.none))),
                onPressed: () {},
                child: Text(
                  "Your Scheduled calls",
                  style: BrandStyles.subtitle,
                ),
              ),
              Spacer(),
            ],
          );
        }
        return Center(
            child: CircularProgressIndicator(color: BrandColors.blue));
      },
    );
  }
}
