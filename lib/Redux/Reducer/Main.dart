import 'package:musicau/Redux/Actions/Actions.dart';
import 'package:musicau/Redux/State/Musicau.dart';

Musicau appReducer(state, action) {
  if (action is PlayMusicAction) {
    return action.handle(state);
  }
  if (action is AddMusic) {
    return action.handle(state);
  }

  if (action is PauseMusicAction) {
    return action.handle(state);
  }

  if (action is MusicDurationAction) {
    return action.handle(state);
  }

  if (action is MusicCompleteAction) {
    return action.handle(state);
  }

  if (action is MusicCurrentPositionAction) {
    return action.handle(state);
  }

  return state;
}
