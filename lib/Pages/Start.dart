import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Bars/Main.dart';
import 'package:musicau/Components/MainBackground.dart';
import 'package:musicau/Config/App.dart';
import 'package:musicau/Drawers/Main.dart';
import 'package:musicau/Pages/Start/Albums.dart';

// ignore: must_be_immutable
class Start extends StatefulWidget {
  List<Song> songs;

  Start({Key key, this.songs});

  @override
  _Start createState() => _Start();
}

class _Start extends State<Start> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MainBackground(
        theChildWidget: Scaffold(
            key: _globalKey,
            backgroundColor: Colors.transparent,
            drawer: Main(songs: widget.songs),
            appBar: main(title: "All Albums", leading: drawerButton()),
            body: Albums(songs: widget.songs)));
  }

  drawerButton() {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: color,
      ),
      onPressed: () {
        _globalKey.currentState.openDrawer();
      },
    );
  }
}
