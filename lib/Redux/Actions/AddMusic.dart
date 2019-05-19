import 'package:flute_music_player/flute_music_player.dart';
import 'package:musicau/Redux/State/Musicau.dart';

class AddMusic {
  Song music;

  AddMusic(this.music);

  handle(Musicau store) {
    store.musics.putIfAbsent(this.music.id, () => this.music);

    return store;
  }
}
