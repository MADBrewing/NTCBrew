import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormWidgetProvider.dart';
import 'package:ntcbrew/ui/formulas/FormulaController.dart';
import 'package:ntcbrew/utils/Strings.dart';

class PlatoScreen extends StatelessWidget {
  static const route = "/formulas/detail/plato";
  final FormulaController _controller = FormulaController.of(FormulaControllerType.PLATO);

  @override
  Widget build(BuildContext context) {
    _controller.createWidgets(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.plato_title)),
      ),
      body: FormulaScreenBody(_controller),
    );
  }
}
