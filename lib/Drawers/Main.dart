import 'dart:math';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicau/Drawers/MainDrawerHeader.dart';

class Main extends StatefulWidget {
  Song song;
  List<Song> songs;

  Main({this.songs, Key key});

  @override
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  @override
  build(BuildContext context) {
    if (widget.song is Song) {
      return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainDrawerHeader(song: widget.song),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  menuItem("All Musics", leading: Icons.all_inclusive),
                  menuItem("Albums", leading: Icons.album),
                  menuItem("Artists", leading: Icons.perm_identity),
                  menuItem("Genre", leading: Icons.graphic_eq),
                  menuItem("Playlist", leading: Icons.featured_play_list),
                  menuItem("Favourites", leading: Icons.favorite),
                  menuItem("Settings", leading: Icons.settings_input_component),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return new Container();
    }
  }

  @override
  void didUpdateWidget(Main oldWidget) {
    print("Update");

    try {
      setState(() {
        widget.song = widget.songs[randomNumber];
      });
    } catch (e) {}

    super.didUpdateWidget(oldWidget);
  }

  int get randomNumber {
    var random = new Random();
    return random.nextInt(100);
  }

  @override
  void initState() {
    try {
      setState(() {
        widget.song = widget.songs[randomNumber];
      });
    } catch (e) {}

    super.initState();
  }
}

Widget menuItem(title, {leading: Icons.keyboard_arrow_right}) {
  return ListTile(
    title: Text(title, style: TextStyle(
      fontFamily: "Aller"
    ),),
    leading: Icon(leading),
  );
}
