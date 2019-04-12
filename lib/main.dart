import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musicau/Pages/Start.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Aller'),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/artworks/netnaija.jpg"),
                fit: BoxFit.cover)),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 110.0, sigmaY: 30.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Start(),
          ),
        ),
//          scaffold()
      ),
    );
  }
}