import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MainBackground extends StatelessWidget {
  final Widget theChildWidget;

  MainBackground({Key key, this.theChildWidget});

  @override
  build(BuildContext context) {
    return StoreConnector(
        converter: (store) => store,
        builder: (context, store) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(albumArt(store)), fit: BoxFit.cover)),
            child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 110.0, sigmaY: 30.0),
                child: new Container(
                    decoration:
                        new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    child: this.theChildWidget))));
  }

  String albumArt(store) {
    String art = "";
    try {
      art = store.state.musics[store.state.playing].albumArt;
      if (art != "" && art != null) return art;
      return "assets/artworks/netnaija.jpg";
    } catch (e) {
      return "assets/artworks/netnaija.jpg";
    }
  }
}
