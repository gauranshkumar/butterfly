import 'package:butterfly/models/music_card.dart';
import 'package:flutter/cupertino.dart';

class AlbumViewModel extends ChangeNotifier {
  MusicCard musicCard;
  void setMusicCard(MusicCard musicCard) {
    this.musicCard = musicCard;
    notifyListeners();
  }

  MusicCard get music => this.musicCard;
}
