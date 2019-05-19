import 'package:musicau/Redux/Reducer/Main.dart';
import 'package:musicau/Redux/State/Musicau.dart';
import 'package:redux/redux.dart';

var store = Store<Musicau>(appReducer,
    /* Function defined in the reducers file */
    initialState: Musicau.initialize());
