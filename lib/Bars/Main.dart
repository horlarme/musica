import 'package:flutter/material.dart';
import 'package:musicau/Config/App.dart';

Widget main({String title, Widget leading}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          color: color,
          fontFamily: "AllerDisplay"),
    ),
    leading: leading != null ? leading : null,
    backgroundColor: Colors.transparent.withOpacity(0.9),
    elevation: 4,
    centerTitle: true ,
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
