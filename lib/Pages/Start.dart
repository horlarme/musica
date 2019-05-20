import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musicau/Bars/Main.dart';
import 'package:musicau/Components/MainBackground.dart';
import 'package:musicau/Components/NowPlaying/LittleAction.dart';
import 'package:musicau/Config/App.dart';
import 'package:musicau/Drawers/Main.dart';
import 'package:musicau/Library/MusicLoader.dart';
import 'package:musicau/Library/Routes.dart';
import 'package:musicau/Pages/Start/Albums.dart';
import 'package:musicau/Redux/Actions/AddMusic.dart';
import 'package:musicau/Redux/PlayMode.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class Start extends StatelessWidget {
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  loadMusics(Store store) async {
    List<Song> musics = await MusicLoader.load();

    musics.forEach((Song song) => store.dispatch(AddMusic(song)));
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector(
        converter: (store) => store,
        builder: (BuildContext context, dynamic store) => MainBackground(
                theChildWidget: Scaffold(
              key: _globalKey,
              backgroundColor: Colors.transparent,
              drawer: Main(),
              appBar:
                  main(title: Routes.home['title'], leading: drawerButton()),
              body: body(store),
              bottomNavigationBar: bottomNavigationBar(store),
            )));
  }

  body(store) {
    return store.state.musics.length > 1
        ? Albums()
        : Center(
            child: RaisedButton.icon(
                onPressed: () => loadMusics(store),
                icon: Icon(Icons.file_download),
                label: Text("Load Musics")));
  }

  bottomNavigationBar(Store store) {
    if (store.state.playMode == PlayMode.PLAY ||
        store.state.playMode == PlayMode.PAUSE) {
      return LittleAction();
    }

    return Container(
      height: 0,
    );
  }

  drawerButton() {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: color,
      ),
      onPressed: () {
        _globalKey.currentState.openDrawer();
      },
    );
  }
}
