import 'dart:io';
import 'dart:ui';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Components/NowPlaying/Action.dart';
import 'package:musicau/Components/SpinningArtwork.dart';

class MainDrawerHeader extends StatelessWidget {
  final Song song;

  MainDrawerHeader({Key key, this.song});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: Stack(fit: StackFit.expand,
          children: <Widget>[
            Container(
                child: this.song.albumArt != null
                    ? Image.file(
                        File(this.song.albumArt),
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/artworks/mixtapes.ng.jpg',
                        fit: BoxFit.cover)),BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: SpinningArtwork(this.song),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              this.song.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "AllerDisplay",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              this.song.artist,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Aller",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.only(
                                  left: 0, right: 15, top: 5, bottom: 5),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                value: 0.5,
                              ),
                            ),
                            Action(),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
