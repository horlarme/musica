import 'dart:io';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicau/Config/colors.dart';

class Album extends StatefulWidget {
  final Song song;

  Album(this.song, {Key key});

  @override
  _Album createState() => _Album();
}

class _Album extends State<Album> with TickerProviderStateMixin {
  AnimationController rotationController;

  bool rotating = false;

  @override
  initState() {
    rotationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    super.initState();
  }

  @override
  build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        print("Double Tap");
      },
      onTap: () {
        _toggleRotation();
      },
      child: Card(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
                child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.white),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                        children: <Widget>[
                      ClipOval(
                          child: widget.song.albumArt != null
                              ? Image.file(
                                  File(widget.song.albumArt),
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/artworks/TalkmuzikDotCom.jpg",
                                  fit: BoxFit.cover,
                                )),
                    ]))),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 2, left: 5, right: 5),
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
                ))
          ],
        ),
      ),
    );
  }

  void _toggleRotation() {
    setState(() {
      rotating = !rotating;

      if (rotating) {
        rotationController.stop();
      } else {
        rotationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }
}
