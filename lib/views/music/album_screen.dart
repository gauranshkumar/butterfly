import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/icons.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/models/music_card.dart';
import 'package:butterfly/routes/route_names.dart';
import 'package:butterfly/views/music/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  MusicCard musicCard = cards[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.white,
        title: Text(
          'Select Music',
          style: BrandStyles.bodyRegular,
        ),
        iconTheme: IconThemeData(color: BrandColors.black),
        centerTitle: true,
      ),
      body: Container(
          color: musicCard.background,
          child: Flexible(
            child: ListView.builder(
                itemCount: musicCard.music.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.musicPlayer);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: BrandColors.black,
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            width: 375,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.headset,
                                    color: BrandColors.black,
                                  ),
                                ),
                                Text(
                                  musicCard.music[index].title,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: "BrandIcons",
                                      color: BrandColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
