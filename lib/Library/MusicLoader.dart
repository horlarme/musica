import 'package:flute_music_player/flute_music_player.dart';
import 'package:simple_permissions/simple_permissions.dart';

class MusicLoader {
  static Future load() async {
    //if this is the first time of loading musics
    try {
      await _requestPermission();

      var musics = await MusicFinder.allSongs();

      return musics;
    } on Exception catch (e) {}
  }

  static Future<PermissionStatus> _requestPermission() async {
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
