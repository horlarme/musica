import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Components/Album.dart';
import 'package:musicau/Helpers/Helper.dart';
import 'package:musicau/main.dart';

class Albums extends StatefulWidget {
  _Albums state;

  List<Song> songs;

  Albums({Key key, this.songs});

  @override
  _Albums createState() {
    return state = _Albums();
  }
}

class _Albums extends State<Albums> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: (getOrientation(context) == Orientation.portrait) ? 2 : 3,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
      childAspectRatio:
          (getOrientation(context) == Orientation.portrait) ? 1.0 : 1.3,
      children: widget.songs != null ?
      widget.songs.map(
            (Song song) => Album(
                title: song.title,
                artist: song.artist,
                artwork: song.albumArt),
          ).toList() : [],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
