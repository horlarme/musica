import 'package:musicau/Helpers/Helper.dart';

Map<String, dynamic> createData(String route, {String title = ""}) {
  return {
    "route": route,
    "title": title == "" ? createTitleCase(route) : title
  };
}

class Routes {
  static final home = createData('home', title: "All Musics");
  static final noWPlaying = createData("nowplaying", title: "Now Playing");
  static final settings = createData("settings", title: "Settings");
  static final albums = createData("albums", title: "All Albums");
  static final albumView = createData("albumView", title: "Track List");
  static final artists = createData("artists", title: "All Artists");
  static final genre = createData("genre", title: "Genres");
  static final playlist = createData("playlist", title: "Playlist");
  static final favourites = createData("favourite", title: "Favourites");
}
