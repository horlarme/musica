import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musicau/Components/SpinningArtwork.dart';
import 'package:musicau/Config/colors.dart';
import 'package:musicau/Redux/Actions/PauseMusicAction.dart';
import 'package:musicau/Redux/Actions/PlayMusicAction.dart';
import 'package:musicau/Redux/PlayMode.dart';
import 'package:redux/redux.dart';

class Album extends StatelessWidget {
  final Song song;

  Album(this.song, {Key key});

  get isAlbum => false;

  @override
  build(BuildContext context) {
    return StoreConnector(
        converter: (store) => store,
        builder: (BuildContext context, Store store) => GestureDetector(
              onDoubleTap: () {
                print("Double Tap");
              },
              onTap: () {
                if (store.state.playing == this.song.id &&
                    store.state.playMode == PlayMode.PLAY) {
                  store.dispatch(new PauseMusicAction());
                } else {
                  store.dispatch(new PlayMusicAction(this.song.id));
                }
              },
              child: Card(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinningArtwork(this.song,
                        playing: store.state.playing,
                        mode: store.state.playMode),
                    Container(
                        margin: EdgeInsets.only(
                            top: 5, bottom: 2, left: 5, right: 5),
                        child: Text(
                          this.song.title,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          textScaleFactor: 0.8,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "AllerDisplay",
                              color: Colors.white),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                        child: Text(
                          this.song.artist,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          textScaleFactor: 0.8,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Aller",
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: backgroundColor.withOpacity(0.8)),
                        )),
                    isAlbum
                        ? Container(
                            margin:
                                EdgeInsets.only(top: 0, left: 10, right: 10),
                            child: Text(
                              "Tracks: 30",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "AllerDisplay",
                                  letterSpacing: 1,
                                  color: backgroundColor.withOpacity(0.8)),
                            ))
                        : Container()
                  ],
                ),
              ),
            ));
  }
}
