import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/HomeScreen.dart';
import 'package:ntcbrew/ui/brewing/board/BoardAddScreen.dart';
import 'package:ntcbrew/ui/brewing/board/BoardListScreen.dart';
import 'package:ntcbrew/ui/brewing/profile/ModuleListScreen.dart';
import 'package:ntcbrew/ui/brewing/profile/ProfileListScreen.dart';
import 'package:ntcbrew/ui/brewing/profile/SensorListScreen.dart';
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

RouteFactory routes = (settings) {
  switch (settings.name) {
    case HomeScreen.route:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case BoardAddScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => BoardAddScreen());
    case BoardListScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => BoardListScreen());
    case StatusCheckScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => StatusCheckScreen());
    case ProfileListScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ProfileListScreen());
    case ModuleListScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ModuleListScreen());
    case SensorListScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => SensorListScreen());
    case AbvScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => AbvScreen());
    case BrixScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => BrixScreen());
    case EbcScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => EbcScreen());
    case EfficiencyScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => EfficiencyScreen());
    case EpmScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => EpmScreen());
    case FgScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => FgScreen());
    case Fg2Screen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => Fg2Screen());
    case FormulaListScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => FormulaListScreen());
    case OgScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => OgScreen());
    case PlatoScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => PlatoScreen());
    case SgScreen.route:
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => SgScreen());
    default:
      UnimplementedError('no route for $settings');
  }
};
