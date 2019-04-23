import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Components/Album.dart';
import 'package:musicau/Helpers/Helper.dart';

// ignore: must_be_immutable
class Albums extends StatelessWidget {

  List<Song> songs;

  Albums({Key key, this.songs});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: (getOrientation(context) == Orientation.portrait) ? 2 : 3,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
      childAspectRatio:
      (getOrientation(context) == Orientation.portrait) ? 1.0 : 1.3,
      children: this.songs != null ?
      this.songs.map(
            (Song song) => Album(song),
      ).toList() : [],
    );
  }

}