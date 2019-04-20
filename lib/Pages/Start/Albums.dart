import 'package:flutter/material.dart';
import 'package:musicau/Components/Album.dart';
import 'package:musicau/Helpers/Helper.dart';

class Albums extends StatelessWidget {
  final albumData = [
    Album(
        title: "Tradition",
        artist: "9ice",
        artwork: "assets/artworks/7_27_Deluxe.png"),
    Album(
        title: "Moral Instruction",
        artist: "Falz d Bad Guy",
        artwork: "assets/artworks/Moral_Instruction.jpg"),
    Album(
        title: "Gracious Mother Love",
        artist: "Best Music of the Year with Grace"),
    Album(
        title: "Gracious Mother Love",
        artist: "Best Music of the Year"),
    Album(
        title: "Tradition",
        artist: "9ice",
        artwork: "assets/artworks/7_27_Deluxe.png"),
    Album(
        title: "Moral Instruction",
        artist: "Falz d Bad Guy",
        artwork: "assets/artworks/Moral_Instruction.jpg"),
    Album(
        title: "Gracious Mother Love",
        artist: "Best Music of the Year with Grace"),
    Album(
        title: "Gracious Mother Love",
        artist: "Best Music of the Year"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: (getOrientation(context) == Orientation.portrait) ? 2 : 3,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
      childAspectRatio:
          (getOrientation(context) == Orientation.portrait) ? 1.0 : 1.3,
      children: albumData,
    );
  }
}
