import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormWidgetProvider.dart';
import 'package:ntcbrew/ui/formulas/FormulaController.dart';
import 'package:ntcbrew/utils/Strings.dart';

class AbvScreen extends StatelessWidget {
  static const route = "/formulas/detail/abv";
  final FormulaController _controller = FormulaController.of(FormulaControllerType.ABV);

  @override
  Widget build(BuildContext context) {
    _controller.createWidgets(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.abv_title)),
      ),
      body: FormulaScreenBody(_controller),
    );
  }
}
