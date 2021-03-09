import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.getString(StringKey.HomeScreen_Title)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Brewing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Formulas',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
