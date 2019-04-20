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
    return Card(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 15),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage(this.artwork != null
                          ? this.artwork
                          : "assets/artworks/TalkmuzikDotCom.jpg")))),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 2, left: 10, right: 10),
              child: Text(
                this.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "AllerDisplay",
                    letterSpacing: 1,
                    color: Colors.white),
              )),
          Container(
              margin: EdgeInsets.only(top: 0, bottom: 5, left: 10, right: 10),
              child: Text(
                this.artist,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "AllerDisplay",
                    letterSpacing: 1,
                    color: backgroundColor.withOpacity(0.8)),
              ))
        ],
      ),
    );
  }
}
