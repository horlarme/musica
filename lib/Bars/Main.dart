import 'package:flutter/material.dart';
import 'package:musicau/Config/App.dart';

Widget main({TabBar tab}) {
  return SliverAppBar(
    title: Text(
      "My Music",
      style: TextStyle(
          color: color,
          fontSize: 23,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold),
    ),
    leading: Icon(
      Icons.menu,
      color: color,
    ),
    backgroundColor: Colors.transparent.withOpacity(0.4),
    expandedHeight: 200.0,
    elevation: 4,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset("assets/artworks/netnaija.jpg", fit: BoxFit.cover,),
    ),
    bottom: tab,
    actions: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            color: color,
          ))
    ],
//    flexibleSpace: FlexibleSpaceBar(
//      background:
//          Image.asset('assets/artworks/mixtapes.ng.jpg', fit: BoxFit.cover),
//    ),
  );
}
