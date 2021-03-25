import 'package:flutter/material.dart';

Widget titleH1(String title, BuildContext context) {
  return Text(title, style: Theme.of(context).textTheme.headline1);
}

Widget titleH2(String title, BuildContext context) {
  return Text(title, style: Theme.of(context).textTheme.headline2);
}

Widget titleH3(String title, BuildContext context) {
  return Text(title, style: Theme.of(context).textTheme.headline3);
}

Widget titleH4(String title, BuildContext context) {
  return Text(title, style: Theme.of(context).textTheme.headline4);
}