import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/icons.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/models/user.dart';
import 'package:butterfly/view_models/user/user_view_model.dart';
import 'package:butterfly/views/feed/feed_screen.dart';
import 'package:butterfly/views/music/music_screen.dart';
import 'package:butterfly/views/music/player.dart';
import 'package:butterfly/views/profile/profile_screen.dart';
import 'package:butterfly/views/psy_tests/psychology_test.dart';
import 'package:butterfly/views/sessions/sessions.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  var bottomNavItems = [
    TabItem(
      icon: Icon(Icons.home_outlined),
      isIconBlend: true,
      title: 'Home',
    ),
    TabItem(
      icon: Icon(
        BrandIcons.doc_text,
        size: 20,
      ),
      isIconBlend: true,
      title: 'Test',
    ),
    TabItem(
      icon: Icon(
        BrandIcons.headphones_alt,
        size: 28,
      ),
      title: 'Calm down!',
      isIconBlend: true,
    ),
    TabItem(
      icon: Icon(
        BrandIcons.award,
        size: 20,
      ),
      title: 'Sessions',
      isIconBlend: true,
    ),
    TabItem(
      icon: Icon(Icons.account_circle_outlined),
      title: 'Profile',
      isIconBlend: true,
    ),
  ];

  List<Widget> _screens() {
    return <Widget>[
      FeedScreen(),
      PsychoTests(),
      MusicScreen(),
      SessionScreen(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: BrandColors.blue,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: FutureBuilder<ButterflyUser>(
                future: Provider.of<UserViewModel>(context).getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(snapshot.data.profilePictureUrl),
                    );
                  } else {
                    return Container();
                  }
                },
              )),
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: ConvexAppBar(
        items: bottomNavItems,
        backgroundColor: BrandColors.blue,
        onTap: _onItemTapped,
        style: TabStyle.fixedCircle,
        activeColor: BrandColors.white,
        initialActiveIndex: 0,
        height: 60,
      ),
      body: IndexedStack(
        children: _screens(),
        index: _selectedIndex,
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder<ButterflyUser>(
        future: Provider.of<UserViewModel>(context).getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: size.height,
              width: size.width * .75,
              decoration: BoxDecoration(
                color: BrandColors.blue,
              ),
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            snapshot.data.profilePictureUrl,
                            width: 60,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          children: [
                            Text(
                              snapshot.data.name,
                              style: BrandStyles.bodyBold
                                  .copyWith(color: BrandColors.white),
                            ),
                            SizedBox(height: 6),
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
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Divider(color: BrandColors.white),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle_outlined,
                        color: BrandColors.white,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: BrandColors.white,
                      ),
                      title: Text(
                        'Profile',
                        style: BrandStyles.bodyRegular
                            .copyWith(color: BrandColors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.call,
                        color: BrandColors.white,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: BrandColors.white,
                      ),
                      title: Text(
                        'Calls',
                        style: BrandStyles.bodyRegular
                            .copyWith(color: BrandColors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        BrandIcons.headphones_alt,
                        color: BrandColors.white,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: BrandColors.white,
                      ),
                      title: Text(
                        'Music',
                        style: BrandStyles.bodyRegular
                            .copyWith(color: BrandColors.white),
                      ),
                    ),
                    Spacer(),
                    OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              BrandColors.violet),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10)),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: BrandColors.white),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              ContinuousRectangleBorder(
                                  side: BorderSide.none))),
                      onPressed: () {},
                      child: Text(
                        "Your Scheduled calls",
                        style: BrandStyles.subtitle
                            .copyWith(color: BrandColors.black),
                      ),
                    ),
                    SizedBox(height: 16)
                  ],
                ),
              )),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(color: BrandColors.blue));
          }
        },
      ),
    );
  }
}
