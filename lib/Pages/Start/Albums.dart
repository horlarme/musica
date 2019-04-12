import 'package:flutter/material.dart';
import 'package:musicau/Components/Album.dart';

class Albums extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: [
              Row(
                children: <Widget>[
                  Album(),
                  Album()
                ],
              ),
              Row(
                children: <Widget>[
                  Album(),
                  Album()
                ],
              ),
              Row(
                children: <Widget>[
                  Album(),
                  Album()
                ],
              ),
              Row(
                children: <Widget>[
                  Album(),
                  Album()
                ],
              ),
              Row(
                children: <Widget>[
                  Album(),
                  Album()
                ],
              ),
              Row(
                children: <Widget>[
                  Album(),
                  Album()
                ],
              ),
            ])
    );
  }
}
