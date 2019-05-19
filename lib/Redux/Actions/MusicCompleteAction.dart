import 'package:musicau/Redux/PlayMode.dart';
import 'package:musicau/Redux/State/Musicau.dart';

class MusicCompleteAction {
  int songId;

  MusicCompleteAction(this.songId);

  handle(Musicau state) {
    state.playMode = PlayMode.STOP;

    return state;
  }
}
