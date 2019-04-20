import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musicau/Bars/Main.dart';
import 'package:musicau/Config/App.dart';
import 'package:musicau/Pages/Start/Albums.dart';

class Start extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: main(tab: tabBar()),
      body: TabBarView(
        children: [
          Albums(),
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
}

Tab _tab(String tabTitle, {IconData icon = Icons.play_circle_outline}) {
  return Tab(
      icon: Icon(
        icon,
      ),
      text: tabTitle);
}
