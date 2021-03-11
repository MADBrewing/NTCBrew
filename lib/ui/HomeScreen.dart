import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/brewing/brewing_intro/BrewingIntroScreen.dart';
import 'package:ntcbrew/ui/formulas/list/FormulaListScreen.dart';
import 'package:ntcbrew/utils/Strings.dart';

class HomeScreen extends StatefulWidget {
  static const route = "/home";

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _screens = <Widget> [
    BrewingIntroScreen(),
    FormulaListScreen()
  ];

  void _onItemTapped(BuildContext context, int index) {
    if (_selectedIndex == index) {
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.home_title)),
      ),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: getNavBar(context),
    );
  }

  Widget getNavBar(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: getString(context, (res) => res?.home_bottomnavbar_brewing),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: getString(context, (res) => res?.home_bottomnavbar_formula),
        ),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: _selectedIndex,
      onTap: (index) {
        _onItemTapped(context, index);
      },
    );
  }
}


