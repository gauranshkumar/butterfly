import 'package:butterfly/config/colors.dart';
import 'package:butterfly/models/butterfly_music.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicCard {
  final Image illustration;
  final String title;
  final Color background;
  final List<ButterflyMusic> music;
  final String subTitle;

  MusicCard(
      {this.illustration,
      this.title,
      this.subTitle,
      this.background,
      this.music});
}

List<MusicCard> cards = [
  MusicCard(
      illustration: Image.asset("assets/low_mood.png"),
      title: "Bad Mood",
      background: BrandColors.lightGreen,
      subTitle: "Uplift your Sadness",
      music: []),
  MusicCard(
      illustration: Image.asset("assets/anxiety.png"),
      title: "Anxiety",
      background: BrandColors.lightRed,
      subTitle: "Heal from Amxiety",
      music: []),
  MusicCard(
      illustration: Image.asset("assets/work_life.png"),
      title: "Work Life",
      background: BrandColors.lightYellow,
      subTitle: "Improve your Work",
      music: []),
  MusicCard(
      illustration: Image.asset("assets/meditation.png"),
      title: "Meditation",
      background: BrandColors.lightBlue,
      subTitle: "Daily session for a better life",
      music: []),
  MusicCard(
      illustration: Image.asset("assets/nature.png"),
      title: "Nature Sound",
      background: BrandColors.lightViolet,
      subTitle: "Soothing Nature Sound",
      music: []),
  MusicCard(
      illustration: Image.asset("assets/mantras.png"),
      title: "Mantras",
      background: BrandColors.lightGreen,
      subTitle: "Powerful Mantra Sounds",
      music: []),
];
