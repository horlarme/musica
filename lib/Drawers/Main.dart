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
          child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MainDrawerHeader(song: widget.song),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        menuItem("All Musics", "/albums", leading: Icons.all_inclusive),
                        menuItem("Albums", "/albums", leading: Icons.album),
                        menuItem("Artists", "/albums", leading: Icons.perm_identity),
                        menuItem("Genre",  "/albums",leading: Icons.graphic_eq),
                        menuItem("Playlist", "/albums", leading: Icons.featured_play_list),
                        menuItem("Favourites", "/albums", leading: Icons.favorite),
                        menuItem("Settings", "/albums",
                            leading: Icons.settings_input_component),
                      ],
                    ),
                  )
                ],
              )));
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
    return random.nextInt(20);
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

  Widget menuItem(String title, String route, {IconData leading: Icons.keyboard_arrow_right}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontFamily: "Aller", color: Colors.white,),
      ),
      leading: Icon(leading, color: Colors.white,),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
