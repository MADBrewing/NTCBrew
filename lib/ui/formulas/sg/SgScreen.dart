import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormWidgetProvider.dart';
import 'package:ntcbrew/ui/formulas/FormulaController.dart';
import 'package:ntcbrew/utils/Strings.dart';

class SgScreen extends StatelessWidget {
  static const route = "/formulas/detail/sg";
  final FormulaController _controller = FormulaController.of(FormulaControllerType.SG);

  @override
  Widget build(BuildContext context) {
    _controller.createWidgets(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.sg_title)),
      ),
      body: FormulaScreenBody(_controller),
    );
  }
}
