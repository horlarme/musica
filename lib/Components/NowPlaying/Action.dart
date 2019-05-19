import 'package:flutter/material.dart';
import 'package:musicau/Redux/Actions/Actions.dart';
import 'package:musicau/Redux/PlayMode.dart';
import 'package:musicau/Redux/State/Musicau.dart';

final action = new Musicau({});

class Action extends StatelessWidget {
  final action;

  Action({this.action});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 144),
        child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: _playPrevious,
                  icon: Icon(Icons.skip_previous),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  tooltip: "Play Previous Song",
                ),
                IconButton(
                  onPressed: _play,
                  icon: Icon(action.state.playMode == PlayMode.PLAY
                      ? Icons.pause
                      : Icons.play_arrow),
                  padding: EdgeInsets.zero,
                  tooltip: "Play or Pause Song",
                  color: Colors.white,
                ),
                IconButton(
                  tooltip: "Play Next Song",
                  onPressed: _playNext,
                  icon: Icon(Icons.skip_next),
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                )
              ],
            )));
  }

  void _playPrevious() {
//    action.playMusic(action.prevMusic??action.playing);
  }

  void _play() {
    if (action.state.playMode == PlayMode.PLAY) {
      action.dispatch(new PauseMusicAction());
    } else {
      action.dispatch(new PlayMusicAction(action.state.playing));
    }
  }

  void _playNext() {
//    action.playMusic(
//        action.prevMusic??action.playing
//    );
  }
}
