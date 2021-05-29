import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/icons.dart';
import 'package:butterfly/view_models/user/user_view_model.dart';
import 'package:butterfly/views/feed/feed_screen.dart';
import 'package:butterfly/views/music/music_screen.dart';
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
    Provider.of<UserViewModel>(context).getUser();

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
