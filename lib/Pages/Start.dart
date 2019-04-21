import 'dart:ui';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Bars/Main.dart';
import 'package:musicau/Config/App.dart';
import 'package:musicau/Drawers/Main.dart';
import 'package:musicau/Pages/Start/Albums.dart';

// ignore: must_be_immutable
class Start extends StatefulWidget {

  List<Song>songs;

  Start({Key key, this.songs});

  @override
  _Start createState() => _Start();
}

class _Start extends State<Start> with SingleTickerProviderStateMixin {
  List<Tab> _tabs = [
    _tab("All", icon: Icons.play_circle_outline),
    _tab("Albums", icon: Icons.album),
    _tab("Artists", icon: Icons.person),
  ];

  TabController tabController;

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      backgroundColor: Colors.transparent,
      drawer: Main(),
      appBar: main(tab: tabBar(), leading: drawerButton()),
      body: TabBarView(
        children: [
          Albums(songs: widget.songs),
          Albums(),
          Albums(),
        ],
        controller: tabController,
      ),
    );
  }

  TabBar tabBar() => TabBar(
        indicatorColor: color,
        unselectedLabelColor: color,
        labelColor: color,
        labelStyle: TextStyle(letterSpacing: 1, fontFamily: "Aller"),
        tabs: _tabs,
        controller: tabController,
      );

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: _tabs.length, vsync: this);
  }

  drawerButton() {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: color,
      ),
      onPressed: (){
        _globalKey.currentState.openDrawer();
      },
    );
  }
}

Tab _tab(String tabTitle, {IconData icon = Icons.play_circle_outline}) {
  return Tab(
      icon: Icon(
        icon,
      ),
      text: tabTitle);
}
