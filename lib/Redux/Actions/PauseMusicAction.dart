import 'package:musicau/Redux/PlayMode.dart';
import 'package:musicau/Redux/State/Musicau.dart';

class PauseMusicAction {
  Musicau handle(Musicau state) {
    state.player.pause();
    state.playMode = PlayMode.PAUSE;
    return state;
  }
}
