import 'package:butterfly/config/colors.dart';
import 'package:butterfly/config/icons.dart';
import 'package:butterfly/config/styles.dart';
import 'package:butterfly/models/music_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';

class Player extends StatefulWidget {
  Player({Key key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  FlutterSoundPlayer _myPlayer = FlutterSoundPlayer();

  bool _mPlayerIsInited = false;

  @override
  void initState() {
    _myPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _myPlayer.closeAudioSession();
    _myPlayer = null;
    super.dispose();
  }

  final music = cards[1];
  final selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BrandColors.deepblack,
          elevation: 0,
          title: Text('Music Player',
              style:
                  BrandStyles.bodyRegular.copyWith(color: BrandColors.white)),
          centerTitle: true,
          iconTheme: IconThemeData(color: BrandColors.white),
        ),
        body: Container(
          width: size.width,
          height: size.height,
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
                  print(
                      "Playing ${music.music[selectedIndex].musicPath.toString()}");
                  if (_mPlayerIsInited) {
                    await _myPlayer.startPlayer(
                        fromURI: 'assets/music/music.adts',
                        codec: Codec.aacADTS,
                        whenFinished: () {
                          setState(() {});
                        });
                    print(
                        "Playing ${music.music[selectedIndex].musicPath.toString()}");
                  }

                  //player.play();
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
