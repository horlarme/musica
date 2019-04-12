import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicau/Config/colors.dart';

class Album extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Container(
      width: 200,
        padding: EdgeInsets.only(top: 15,right: 15,left: 15),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Stack(children: <Widget>[
                ClipOval(
                    child: Image.asset(
                  "assets/artworks/TalkmuzikDotCom.jpg",
                  fit: BoxFit.cover,
                )),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 2),
                child: Text(
              "The Album",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "AllerDisplay",
                letterSpacing: 1,
                color: Colors.white
              ),
            )),
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 5),
                child: Text(
              "Falz D Bad Guy",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "AllerDisplay",
                letterSpacing: 1,
                color: backgroundColor.withOpacity(0.8)
              ),
            ))
          ],
      ),
    );
  }
}
