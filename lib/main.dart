import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:musicau/Pages/Start.dart';
import 'package:simple_permissions/simple_permissions.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
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
      home: Start(songs: songList,),
      routes: <String, WidgetBuilder>{
        "/all": (BuildContext context) => Start(songs: songList,),
        "/albums": (BuildContext context) => Start(songs: songList,),
      },
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
