import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/HomeScreen.dart';
import 'package:ntcbrew/utils/Strings.dart';

void main() {
  Strings.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NTC Brew',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}