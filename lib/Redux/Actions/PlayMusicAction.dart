import 'package:musicau/Redux/PlayMode.dart';
import 'package:musicau/Redux/State/Musicau.dart';

class PlayMusicAction {
  int songId;

  PlayMusicAction(this.songId);

  handle(Musicau store) {
    store.prevMusic = store.playing ?? this.songId;

    try {
      //let's check if we should stop music and start again or just
      //continue playing
      if (store.playing != this.songId) store.player.stop();
    } catch (e) {}

    store.playing = this.songId;
    store.player.play(store.musics[songId].uri, isLocal: true);

    store.playMode = PlayMode.PLAY;

    return store;
  }
}
