import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'
    show
        BoxDecoration,
        BuildContext,
        Container,
        EdgeInsets,
        StatelessWidget,
        Widget;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musicau/Components/NowPlaying/Action.dart';
import 'package:musicau/Components/SpinningArtwork.dart';
import 'package:musicau/Redux/PlayMode.dart';

class LittleAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (store) => store,
      builder: (BuildContext context, dynamic store) => buildWidget(store),
    );
  }

  buildWidget(store) {
    if (store.state.playMode == PlayMode.PAUSE ||
        store.state.playMode == PlayMode.PLAY) {
      return Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: SpinningArtwork(store.state.musics[store.state.playing],
                    size: 'small')),
            Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: Text(
                            store.state.musics[store.state.playing].title,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Aller"),
                            overflow: TextOverflow.ellipsis,
                          )),
                      Flexible(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Text(
                                store.state.musics[store.state.playing].artist,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: "Aller"))),
                      )
                    ],
                  ),
                )),
            Action(action: store)
          ],
        ),
      );
    }

    return Container();
  }
}
