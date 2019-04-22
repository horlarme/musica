import 'dart:io';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

class SpinningArtwork extends StatefulWidget {
  Song song;

  bool playing;

  SpinningArtwork(this.song, {Key key, this.playing = false}) : assert(song is Song);

  @override
  _SpinningArtwork createState() => _SpinningArtwork();
}

class _SpinningArtwork extends State<SpinningArtwork>
    with TickerProviderStateMixin {
  AnimationController rotationController;

  @override
  initState() {
    rotationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    super.initState();
  }

  @override
  void didUpdateWidget(SpinningArtwork oldWidget) {
    //decide on whether to spin or not
    if (widget.playing) {
      rotationController.repeat();
    } else {
      rotationController.stop();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Stack(fit: StackFit.expand, children: <Widget>[
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
            ])));
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }
}
