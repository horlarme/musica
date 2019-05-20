import 'package:musicau/Redux/State/Musicau.dart';

class ChangeRouteAction {
  String route;

  ChangeRouteAction(this.route);

  handle(Musicau state) {
    state.currentRoute = this.route;

    return state;
  }
}
