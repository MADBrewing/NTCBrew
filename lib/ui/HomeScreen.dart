import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/brewing/brewing_intro/BrewingIntroScreen.dart';
import 'package:ntcbrew/ui/formulas/list/FormulaListScreen.dart';
import 'package:ntcbrew/utils/Strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    setState(() {
      if (_selectedIndex == index) {
        return;
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(AppLocalizations.of(context)?.home_title),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Strings.getString(AppLocalizations.of(context)?.home_bottomnavbar_brewing),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: Strings.getString(AppLocalizations.of(context)?.home_bottomnavbar_formula),
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onItemTapped(context, index);
        },
      ),
    );
  }
}

AppBar getAppBar(String? title) {
  return AppBar(
    title: Text(Strings.getString(title)),
  );
}
