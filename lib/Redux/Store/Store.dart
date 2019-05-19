//import 'package:flipperkit_redux_middleware/flipperkit_redux_middleware.dart';
import 'package:musicau/Redux/Reducer/Main.dart';
import 'package:musicau/Redux/State/Musicau.dart';
import 'package:redux/redux.dart';

var store = Store<Musicau>(
  appReducer,
  /* Function defined in the reducers file */
  initialState: Musicau.initialize(),
//    middleware: []..add(new FlipperKitReduxMiddleware(
//           Optional, for filtering action types
//          filter: (actionType) {
//        return actionType.startsWith('\$');
//      })
//)
);
