import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicau/Drawers/MainDrawerHeader.dart';

class Main extends StatelessWidget {
  BuildContext context;

  @override
  build(BuildContext context) {
    this.context = context;

    return Drawer(
        child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainDrawerHeader(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      menuItem("All Musics", "/albums",
                          leading: Icons.all_inclusive),
                      menuItem("Albums", "/albums", leading: Icons.album),
                      menuItem("Artists", "/albums",
                          leading: Icons.perm_identity),
                      menuItem("Genre", "/albums", leading: Icons.graphic_eq),
                      menuItem("Playlist", "/albums",
                          leading: Icons.featured_play_list),
                      menuItem("Favourites", "/albums",
                          leading: Icons.favorite),
                      menuItem("Settings", "/albums",
                          leading: Icons.settings_input_component),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget menuItem(String title, String route,
      {IconData leading: Icons.keyboard_arrow_right}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "Aller",
          color: Colors.white,
        ),
      ),
      leading: Icon(
        leading,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
