import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musicau/Components/Album.dart';
import 'package:musicau/Helpers/Helper.dart';
import 'package:musicau/Redux/State/Musicau.dart';

class Albums extends StatelessWidget {
  Albums({Key key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (store) => store.state,
        builder: (BuildContext context, dynamic state) => Scrollbar(
            child: GridView.count(
                crossAxisCount:
                    (getOrientation(context) == Orientation.portrait) ? 2 : 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
                childAspectRatio:
                    (getOrientation(context) == Orientation.portrait)
                        ? 1.0
                        : 1.3,
                children: _buildAlbumList(state))));
  }

  _buildAlbumList(Musicau state) {
    List<Album> albums = [];

    if (state.musics.length > 0) {
      state.musics.forEach(
        (int index, Song song) => albums.add(Album(song)),
      );
    }

    return albums;
  }
}
