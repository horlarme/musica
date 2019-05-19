import 'package:flute_music_player/flute_music_player.dart';
import 'package:musicau/Redux/PlayMode.dart';

class Musicau {
  int duration;

  int position;

  Musicau(this.musics);

  factory Musicau.initialize() => Musicau({});

  Map<int, Song> musics;

  MusicFinder player = new MusicFinder();

  //music playing, its ID
  int playing = 0;

  //mode of the player, 'playing', 'paused' or 'stopped'
  String playMode = PlayMode.STOP;

  //previously played music
  int prevMusic = 0;

  //next music to be played
  int nextMusic = 1;
}
