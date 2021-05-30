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
      title: "Low Mood",
      background: BrandColors.lightGreen,
      subTitle: "Uplift your Sadness",
      music: [
        ButterflyMusic(
            title: "The-upbeats", musicPath: "assets/music/low-mood-1.mp3"),
        ButterflyMusic(
            title: "Sprinkle", musicPath: "assets/music/low-mood-1.mp3"),
      ]),
  MusicCard(
      illustration: Image.asset("assets/anxiety.png"),
      title: "Anxiety",
      background: BrandColors.lightRed,
      subTitle: "Heal from Anxiety",
      music: [
        ButterflyMusic(
            title: "Unanxious", musicPath: "assets/music/Anxiety-music-1.mp3"),
        ButterflyMusic(
            title: "Rise",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/anxiety-music-2.mp3"),
      ]),
  MusicCard(
      illustration: Image.asset("assets/work_life.png"),
      title: "Work Life",
      background: BrandColors.lightYellow,
      subTitle: "Improve your Work",
      music: [
        ButterflyMusic(
            title: "Let's get going",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/work-music-1.mp3"),
        ButterflyMusic(
            title: "Starter",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/work-music-2.mp3"),
      ]),
  MusicCard(
      illustration: Image.asset("assets/meditation.png"),
      title: "Meditation",
      background: BrandColors.lightBlue,
      subTitle: "Daily session for a better life",
      music: [
        ButterflyMusic(
            title: "Leave the World",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/medidation-music-1.mp3"),
        ButterflyMusic(
            title: "Present",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/meditation-music-2.mp3"),
      ]),
  MusicCard(
      illustration: Image.asset("assets/nature.png"),
      title: "Nature Sound",
      background: BrandColors.lightViolet,
      subTitle: "Soothing Nature Sound",
      music: [
        ButterflyMusic(
            title: "Welcome to Forest",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/Nature-sound-1.mp3"),
        ButterflyMusic(
            title: "Sooo! Natural",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/nature-sound-2.mp3"),
      ]),
  MusicCard(
      illustration: Image.asset("assets/mantras.png"),
      title: "Mantras",
      background: BrandColors.lightGreen,
      subTitle: "Powerful Mantra Sounds",
      music: [
        ButterflyMusic(
            title: "Gayatri Mantra",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/Gayatri-Mantra.mp3"),
        ButterflyMusic(
            title: "Maha Mirtunjay Mantra",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/Maha-Mirtunjay-Mantra.mp3"),
        ButterflyMusic(
            title: "Shanti Mantra",
            musicPath:
                "https://satyam86400.github.io/butterfly-music/Chanakya-Mantra.mp3"),
      ]),
];
