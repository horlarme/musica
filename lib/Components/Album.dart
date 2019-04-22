import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicau/Components/SpinningArtwork.dart';
import 'package:musicau/Config/colors.dart';

class Album extends StatefulWidget {
  final Song song;

  bool playing;

  Album(this.song, {Key key, this.playing = false});

  @override
  _Album createState() => _Album();
}

class _Album extends State<Album> {

  get isAlbum => false;

  @override
  build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        print("Double Tap");
      },
      onTap: () {
        print("Tapped");

        setState(() {
          widget.playing = !widget.playing;
        });
      },
      child: Card(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinningArtwork(widget.song, playing: widget.playing),
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
                )),
            isAlbum ?
            Container(
                margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                child: Text(
                  "Tracks: 30",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "AllerDisplay",
                      letterSpacing: 1,
                      color: backgroundColor.withOpacity(0.8)),
                )) : Container()
          ],
        ),
      ),
    );
  }
}
