import 'dart:io';
import 'dart:ui';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musicau/Components/NowPlaying/Action.dart';
import 'package:musicau/Components/SpinningArtwork.dart';
import 'package:musicau/Redux/PlayMode.dart';
import 'package:musicau/Redux/State/Musicau.dart';
import 'package:redux/redux.dart';

class MainDrawerHeader extends StatelessWidget {
  buildWidget(Store<Musicau> store) {
    Song music;
    if (store.state.playing == 0 &&
        store.state.prevMusic == 0 &&
        store.state.playMode == PlayMode.STOP) {
      music = new Song(
          1, "Not Playing", "Not Playing", "Not Playing", 1, 12, "", "");
    } else {
      music = store.state.musics[store.state.playing];
    }

    return DrawerHeader(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                child: music.albumArt != null
                    ? Image.file(
                        File(music.albumArt),
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/artworks/mixtapes.ng.jpg',
                        fit: BoxFit.cover)),
            BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: SpinningArtwork(music),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              music.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "AllerDisplay",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              music.artist,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Aller",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.only(
                                  left: 0, right: 15, top: 5, bottom: 0),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                value: getProgressPosition(store),
                              ),
                            ),
                            Action(action: store),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (store) => store,
        builder: (BuildContext context, dynamic store) => buildWidget(store));
  }

  getProgressPosition(Store<Musicau> store) {
    return store.state.position / store.state.duration;
  }
}
