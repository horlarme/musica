import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Main extends StatelessWidget {
  GlobalKey _mainDrawer = GlobalKey();

  @override
  build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            child: Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/artworks/mixtapes.ng.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
