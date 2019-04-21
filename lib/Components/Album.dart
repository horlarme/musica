import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicau/Config/colors.dart';

class Album extends StatelessWidget {
  final String genre;

  final String artwork;

  final String artist;

  final String year;

  final String title;

  Album(
      {Key key,
      @required this.title,
      @required this.artist,
      this.year,
      this.artwork,
      this.genre});

  @override
  build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        print("Double Tap");
      },
      onTap: () {
        print('Tapped');
      },
      child: Card(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image:
                            AssetImage("assets/artworks/TalkmuzikDotCom.jpg"),
                        fit: BoxFit.cover)),
                child: this.artwork != null
                    ? Stack(children: <Widget>[
                        ClipOval(
                            child: Image.file(
                          File(this.artwork),
                          fit: BoxFit.cover,
                        )),
                      ])
                    : null),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 2, left: 5, right: 5),
                child: Text(
                  this.title,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "AllerDisplay",
                      color: Colors.white),
                )),
            Container(
                margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                child: Text(
                  this.artist,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "AllerDisplay",
                      letterSpacing: 1,
                      color: backgroundColor.withOpacity(0.8)),
                ))
          ],
        ),
      ),
    );
  }
}
