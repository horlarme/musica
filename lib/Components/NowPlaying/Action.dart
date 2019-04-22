import 'package:flutter/material.dart';

class Action extends StatefulWidget {
  @override
  _Action createState() => new _Action();
}

class _Action extends State<Action> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.skip_previous),
            color: Colors.white,
            iconSize: 28,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.play_circle_outline),
            padding: EdgeInsets.zero,
            color: Colors.white,
            iconSize: 38,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.skip_next),
            color: Colors.white,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
