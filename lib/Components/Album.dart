import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musicau/Components/SpinningArtwork.dart';
import 'package:musicau/Config/colors.dart';
import 'package:musicau/Redux/Actions/PauseMusicAction.dart';
import 'package:musicau/Redux/Actions/PlayMusicAction.dart';
import 'package:musicau/Redux/PlayMode.dart';
import 'package:redux/redux.dart';

class Album extends StatefulWidget {
  final Song song;

  Album(this.song, {Key key});

  @override
  _Album createState() => _Album();
}

class _Album extends State<Album> {
  get isAlbum => false;

  @override
  build(BuildContext context) {
    return StoreConnector(
        converter: (store) => store,
        onWillChange: ,
        builder: (BuildContext context, Store store) => GestureDetector(
              onDoubleTap: () {
                print("Double Tap");
              },
              onTap: () {
                if (store.state.playing == widget.song.id &&
                    store.state.playMode == PlayMode.PLAY) {
                  store.dispatch(new PauseMusicAction());
                } else {
                  store.dispatch(new PlayMusicAction(widget.song.id));
                }
              },
              child: Card(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinningArtwork(widget.song,
                        playing: store.state.playMode == PlayMode.PLAY &&
                            store.state.playing == widget.song.id),
                    Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 2, left: 5, right: 5),
                        child: Text(
                          widget.song.title,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "AllerDisplay",
                              color: Colors.white),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                        child: Text(
                          widget.song.artist,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "AllerDisplay",
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
