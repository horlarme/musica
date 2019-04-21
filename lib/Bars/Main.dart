import 'package:flutter/material.dart';
import 'package:musicau/Config/App.dart';

Widget main({TabBar tab, Widget leading}) {
  return AppBar(
    title: Text(
      "My Music",
      style: TextStyle(
          color: color,
          fontFamily: "AllerDisplay"),
    ),
    leading: leading != null ? leading : null,
    backgroundColor: Colors.transparent.withOpacity(0.9),
    elevation: 4,
    centerTitle: true ,
    bottom: tab,
    actions: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            color: color,
          ))
    ],
  );
}
