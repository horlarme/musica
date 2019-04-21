import 'dart:ui';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Pages/Start.dart';
import 'package:simple_permissions/simple_permissions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  _MyApp state;

  @override
  _MyApp createState() {
    return state = _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  MusicFinder player = new MusicFinder();

  List<Song> songList;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Aller'),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/artworks/netnaija.jpg"),
                fit: BoxFit.cover)),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 110.0, sigmaY: 30.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Start(songs: songList),
          ),
        ),
//          scaffold()
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _getMusics();
  }

  void _getMusics() async {
    try {
      await _requestPermission();
      var allSongs = await MusicFinder.allSongs();

      setState(() {
        songList = allSongs;
      });
    } on Exception catch (e) {
      print("Exception");
      print(e);
    }
  }

  Future<PermissionStatus> _requestPermission() async {
    PermissionStatus permissionStatus =
        await SimplePermissions.getPermissionStatus(Permission.Camera);

    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.notDetermined) {
      permissionStatus =
          await SimplePermissions.requestPermission(Permission.Camera);
      await SimplePermissions.requestPermission(Permission.ReadExternalStorage);
      await SimplePermissions.requestPermission(
          Permission.WriteExternalStorage);
    } else if (permissionStatus == PermissionStatus.deniedNeverAsk) {}

    return permissionStatus;
  }
}
