import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/icons.dart';
import 'package:butterfly/models/music_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  const Player({Key key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late AudioPlayer player;
  late AudioPlayer player2;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player2 = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    player2.dispose();
    super.dispose();
  }

  final music = cards[1];
  final selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: BrandColors.deepblack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: music.background),
              child: SizedBox(
                child: music.illustration,
                height: 100,
                width: 100,
              ),
            ),
            Text(
              music.music[selectedIndex].title,
              style: TextStyle(
                fontFamily: "BrandIcons",
                color: BrandColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            RawMaterialButton(
              onPressed: () async {
                print("Playing");
                await player
                    .setAsset(music.music[selectedIndex].musicPath.toString());
                player.play();
              },
              child: Icon(
                Icons.play_arrow,
                color: BrandColors.deepblack,
              ),
              padding: EdgeInsets.all(24),
              fillColor: music.background,
              shape: CircleBorder(),
            )
          ],
        ),
      ),
    );
  }
}

// Future play_song(MusicCard m, int selectedIndex) {
//   AudioPlayer audioPlayer = AudioPlayer();
//   AudioPlayer.logEnabled = true;
//   play() async {
//     int result = await audioPlayer.play(m.music[selectedIndex].musicPath);
//     if (result == 1) {
//       // success
//       print("Playing Success");
//     }
//   }
// }
