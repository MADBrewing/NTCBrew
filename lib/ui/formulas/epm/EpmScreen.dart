import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormWidgetProvider.dart';
import 'package:ntcbrew/utils/BrewUtils.dart';
import 'package:ntcbrew/utils/Strings.dart';

class EpmScreen extends StatelessWidget {
  static const route = "/formulas/detail/epm";
  final FormWidgetProvider widgetProvider = FormWidgetProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.epm_title)),
      ),
      body: CalcBody(widgetProvider.getEpmMenu(context)),
    );
  }
}

class CalcBody extends StatefulWidget {
  final List<Input> inputs;

  CalcBody(this.inputs);

  @override
  State<StatefulWidget> createState() => _CalcBody(inputs);
}

class _CalcBody extends State<CalcBody> {
  final List<Input> _inputs;
  String text = "-";

  _CalcBody(this._inputs);

  @override
  void initState() {
    super.initState();
    _inputs.forEach((element) {
      element.textController.addListener(_setResult);
    });
  }

  @override
  void dispose() {
    _inputs.forEach((element) {
      element.textController.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _inputs.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _top();
        } else {
          return _inputs[index - 1];
        }
      },
    );
  }

  Widget _top() {
    return Container(
      padding: const EdgeInsets.all(32),
      height: 200,
      alignment: Alignment.center,
      child: FittedBox(fit: BoxFit.scaleDown, child: Text(text, style: Theme.of(context).textTheme.headline3)),
    );
  }

  _setResult() {
    double? batchSize = double.tryParse(_inputs.firstWhere((element) => element.type == FormulaInputType.BATCH_SIZE).textController.text);
    double? plato = double.tryParse(_inputs.firstWhere((element) => element.type == FormulaInputType.PLATO).textController.text);

    setState(() {
      if (batchSize != null && plato != null) {
        text = BrewUtils.calcEPM(batchSize, plato).toStringAsFixed(2);
      } else {
        text = "-";
      }
    });
  }
}
