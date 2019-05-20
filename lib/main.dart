import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musicau/Library/Routes.dart';
import 'package:musicau/Pages/Start.dart';
import 'package:musicau/Redux/Actions/Actions.dart';
import 'package:musicau/Redux/State/Musicau.dart';
import 'package:musicau/Redux/Store/Store.dart' as ourStore;
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with WidgetsBindingObserver {
  Store<Musicau> store = ourStore.store;

  @override
  Widget build(BuildContext context) => StoreProvider<dynamic>(
      store: this.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Aller'),
        home: Start(),
        routes: <String, WidgetBuilder>{
          Routes.home['route']: (BuildContext context) => Start(),
          Routes.albums['route']: (BuildContext context) => Start(),
        },
      ));

  @override
  void initState() {
    initializeMusicPlayPlugin();

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    //stopping music player
    this.store.state.player.stop();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Lifecycle changed: $state");
  }

  void initializeMusicPlayPlugin() {
    Musicau state = store.state;

    state.player.setCompletionHandler(() {
      store.dispatch(MusicCompleteAction(state.playing));
    });

    state.player.setDurationHandler((Duration duration) {
      store.dispatch(MusicDurationAction(duration));
    });

    state.player.setPositionHandler((Duration position) {
      store.dispatch(MusicCurrentPositionAction(position));
    });
  }
}
