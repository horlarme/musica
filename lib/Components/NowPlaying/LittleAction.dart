import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'
    show
        BoxDecoration,
        BuildContext,
        Container,
        EdgeInsets,
        StatelessWidget,
        Widget;
import 'package:musicau/Components/NowPlaying/Action.dart';
import 'package:musicau/Components/SpinningArtwork.dart';

class LittleAction extends StatelessWidget {
  ///[Song] or {null}
  final playing;

  LittleAction({this.playing});

  @override
  Widget build(BuildContext context) {
    if (this.playing != null) {
      return Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: SpinningArtwork(this.playing,
                        playing: true, size: 'small')),
            Expanded(
              flex: 4,
              child: Container(margin: EdgeInsets.only(left: 5),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Text(
                        this.playing.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "AllerDisplay"),
                        overflow: TextOverflow.fade,
                      )),
                  Flexible(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(this.playing.artist,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: "AllerDisplay"))),
                  )
                ],
              ),
            )),
            Expanded(
              child: Action(),
              flex: 4,
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
