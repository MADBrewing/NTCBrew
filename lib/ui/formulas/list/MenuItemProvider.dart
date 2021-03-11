import 'package:ntcbrew/ui/formulas/abv/AbvScreen.dart';
import 'package:ntcbrew/ui/formulas/brix/BrixScreen.dart';
import 'package:ntcbrew/ui/formulas/ebc/EbcScreen.dart';
import 'package:ntcbrew/ui/formulas/efficiency/EfficiencyScreen.dart';
import 'package:ntcbrew/ui/formulas/epm/EpmScreen.dart';
import 'package:ntcbrew/ui/formulas/fg/FgScreen.dart';
import 'package:ntcbrew/ui/formulas/fg2/Fg2Screen.dart';
import 'package:ntcbrew/ui/formulas/og/OgScreen.dart';
import 'package:ntcbrew/ui/formulas/plato/PlatoScreen.dart';
import 'package:ntcbrew/ui/formulas/sg/SgScreen.dart';

class MenuItemProvider {

  List<MenuItem> getMenuItems() => [
    MenuItem("ABV", AbvScreen.route),
    MenuItem("Brix", BrixScreen.route),
    MenuItem("EBC", EbcScreen.route),
    MenuItem("Efficiency", EfficiencyScreen.route),
    MenuItem("EPM", EpmScreen.route),
    MenuItem("FG", FgScreen.route),
    MenuItem("FG2", Fg2Screen.route),
    MenuItem("OG", OgScreen.route),
    MenuItem("Plato", PlatoScreen.route),
    MenuItem("SG", SgScreen.route)
  ];
}

class MenuItem {
  String name;
  String path;

  MenuItem(this.name, this.path);
}