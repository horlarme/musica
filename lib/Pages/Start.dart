import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musicau/Bars/Main.dart';
import 'package:musicau/Config/App.dart';

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

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(slivers: <Widget>[
        main(tab: tabBar()),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(height: 400, color: Colors.green,),
              Container(height: 400, color: Colors.blue,)
            ],
          ),
        ),
      ]),
    );
  }

  TabBar tabBar() => TabBar(
        indicatorColor: backgroundColor,
        unselectedLabelColor: backgroundColor,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        tabs: _tabs,
        controller: _tabController,
      );

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
  }
}

Tab _tab(String tabTitle, {IconData icon = Icons.play_circle_outline}) {
  return Tab(
      icon: Icon(
        icon,
      ),
      text: tabTitle);
}
