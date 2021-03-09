import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/HomeScreen.dart';
import 'package:ntcbrew/ui/brewing/boards_add/BoardAddScreen.dart';
import 'package:ntcbrew/ui/brewing/boards_list/BoardListScreen.dart';
import 'package:ntcbrew/ui/brewing/status_check/StatusCheckScreen.dart';
import 'package:ntcbrew/ui/formulas/abv/AbvScreen.dart';
import 'package:ntcbrew/ui/formulas/brix/BrixScreen.dart';
import 'package:ntcbrew/ui/formulas/ebc/EbcScreen.dart';
import 'package:ntcbrew/ui/formulas/efficiency/EfficiencyScreen.dart';
import 'package:ntcbrew/ui/formulas/epm/EpmScreen.dart';
import 'package:ntcbrew/ui/formulas/fg/FgScreen.dart';
import 'package:ntcbrew/ui/formulas/fg2/Fg2Screen.dart';
import 'package:ntcbrew/ui/formulas/list/FormulaListScreen.dart';
import 'package:ntcbrew/ui/formulas/og/OgScreen.dart';
import 'package:ntcbrew/ui/formulas/plato/PlatoScreen.dart';
import 'package:ntcbrew/ui/formulas/sg/SgScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  HomeScreen.route: (context) => HomeScreen(),
  BoardAddScreen.route: (context) => BoardAddScreen(),
  BoardListScreen.route: (context) => BoardListScreen(),
  StatusCheckScreen.route: (context) => StatusCheckScreen(),
  AbvScreen.route: (context) => AbvScreen(),
  BrixScreen.route: (context) => BrixScreen(),
  EbcScreen.route: (context) => EbcScreen(),
  EfficiencyScreen.route: (context) => EfficiencyScreen(),
  EpmScreen.route: (context) => EpmScreen(),
  FgScreen.route: (context) => FgScreen(),
  Fg2Screen.route: (context) => Fg2Screen(),
  FormulaListScreen.route: (context) => FormulaListScreen(),
  OgScreen.route: (context) => OgScreen(),
  PlatoScreen.route: (context) => PlatoScreen(),
  SgScreen.route: (context) => SgScreen(),
};
