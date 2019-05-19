import 'dart:io';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Redux/PlayMode.dart';

// ignore: must_be_immutable
class SpinningArtwork extends StatefulWidget {
  Song song;

  String size;

  int playing;

  String mode;

  SpinningArtwork(this.song,
      {Key key,
      this.playing = 0,
      this.size = 'large',
      this.mode = PlayMode.PAUSE})
      : assert(song is Song);

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
    if (widget.playing == widget.song.id &&
        widget.size == "large" &&
        widget.mode == PlayMode.PLAY) {
      rotationController.repeat();
    } else {
      rotationController.stop();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.size == 'small' ? 30 : 90,
        width: widget.size == 'small' ? 30 : 90,
        decoration: BoxDecoration(
          border: Border.all(
              width: widget.size == 'small' ? 2 : 5, color: Colors.white),
          borderRadius: BorderRadius.circular(1000),
        ),
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
          child: ClipOval(
              child: widget.song.albumArt != null
                  ? Image.file(
                      File(widget.song.albumArt),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/artworks/TalkmuzikDotCom.jpg",
                      fit: BoxFit.cover,
                    )),
        ));
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }
}
