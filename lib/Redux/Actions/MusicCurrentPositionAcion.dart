import 'package:musicau/Redux/State/Musicau.dart';

class MusicCurrentPositionAction {
  Duration position;

  MusicCurrentPositionAction(this.position);

  handle(Musicau state) {
    state.position = this.position.inMilliseconds;

    return state;
  }
}
