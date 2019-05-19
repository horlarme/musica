import 'package:musicau/Redux/State/Musicau.dart';

class MusicDurationAction {
  Duration duration;

  MusicDurationAction(this.duration);

  handle(Musicau state) {
    state.duration = this.duration.inMilliseconds;

    return state;
  }
}
