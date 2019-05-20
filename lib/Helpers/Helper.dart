import 'package:flutter/widgets.dart';

getOrientation(BuildContext context) {
  return MediaQuery.of(context).orientation;
}

createTitleCase(String title) {
  return title[0].toString().toUpperCase() +
      title.toString().substring(1).toLowerCase();
}

ucFirst(String text) {
  return text[0].toString().toUpperCase() + text.toString().substring(1);
}
