import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormulaController.dart';
import 'package:ntcbrew/utils/Strings.dart';

import '../FormWidgetProvider.dart';

class Fg2Screen extends StatelessWidget {
  static const route = "/formulas/detail/fg2";
  final FormulaController _controller = FormulaController.of(FormulaControllerType.FG2);

  @override
  Widget build(BuildContext context) {
    _controller.createWidgets(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.fg2_title)),
      ),
      body: FormulaScreenBody(_controller),
    );
  }
}
