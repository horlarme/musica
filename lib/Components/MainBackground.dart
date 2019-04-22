import 'dart:ui';

import 'package:flutter/material.dart';

class MainBackground extends StatefulWidget{

  Widget theChildWidget;

  MainBackground({Key key, this.theChildWidget});

  @override
  _MainBackground createState() => _MainBackground();
}

class _MainBackground extends State<MainBackground> {

  @override
  build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/artworks/netnaija.jpg"),
              fit: BoxFit.cover)),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 110.0, sigmaY: 30.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: widget.theChildWidget
        ),
      ),
//          scaffold()
    );
  }
}