import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormulaController.dart';

class FormWidgetProvider {
  Input og(BuildContext context, {action = TextInputAction.next}) =>
      Input("OG", FormulaInputType.OG, action: action);

  Input fg(BuildContext context, {action = TextInputAction.next}) =>
      Input("FG", FormulaInputType.FG, action: action);

  Input batchSize(BuildContext context, {action = TextInputAction.next}) =>
      Input("Batch Size", FormulaInputType.BATCH_SIZE, action: action);

  Input plato(BuildContext context, {action = TextInputAction.next}) =>
      Input("Plato", FormulaInputType.PLATO, action: action);

  Input brixStart(BuildContext context, {action = TextInputAction.next}) =>
      Input("Brix Start", FormulaInputType.BRIX_START, action: action);

  Input brixEnd(BuildContext context, {action = TextInputAction.next}) =>
      Input("Brix End", FormulaInputType.BRIX_END, action: action);

  Input weightOfMalt(BuildContext context, {action = TextInputAction.next}) =>
      Input("Weight of Malt", FormulaInputType.WEIGHT_OF_MALT, action: action);

  Input avgMaltEBC(BuildContext context, {action = TextInputAction.next}) =>
      Input("Average Malt EBC", FormulaInputType.AVG_MALT_EBC, action: action);

  Input avgExtr(BuildContext context, {action = TextInputAction.next}) =>
      Input("Average Extr", FormulaInputType.AVG_EXTR, action: action);

  Input attenuation(BuildContext context, {action = TextInputAction.next}) =>
      Input("Attenuation", FormulaInputType.ATTENUATION, action: action);

  Input epm(BuildContext context, {action = TextInputAction.next}) =>
      Input("Epm", FormulaInputType.EPM, action: action);

  Input sg(BuildContext context, {action = TextInputAction.next}) =>
      Input("Sg", FormulaInputType.SG, action: action);
}

enum FormulaInputType { OG, FG, BATCH_SIZE, PLATO, BRIX_START, BRIX_END, WEIGHT_OF_MALT, AVG_MALT_EBC, AVG_EXTR, ATTENUATION, EPM, SG }

class Input extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final String label;
  final FormulaInputType type;
  final TextInputAction? action;
  final String? helperText;

  Input(this.label, this.type, {this.action, this.helperText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textInputAction: action,
        decoration: InputDecoration(
          labelText: label,
          helperText: helperText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  double? getValue() => double.tryParse(textController.text);
}

class FormulaScreenBody extends StatefulWidget {
  final FormulaController _controller;

  FormulaScreenBody(this._controller);

  @override
  State<StatefulWidget> createState() => _FormulaScreenBody(_controller);
}

class _FormulaScreenBody extends State<FormulaScreenBody> {
  final FormulaController _controller;

  _FormulaScreenBody(this._controller);

  @override
  void initState() {
    super.initState();
    _controller.initListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _controller.getWidgets().length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _top();
        } else {
          return _controller.getWidgets()[index - 1];
        }
      },
    );
  }

  Widget _top() {
    return Container(
      padding: const EdgeInsets.all(32),
      height: 200,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: StreamBuilder<String>(
          stream: _controller.stream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            var text = "-";
            if (snapshot.hasData && snapshot.data != null) {
              text = snapshot.data!;
            }
            return FittedBox(fit: BoxFit.scaleDown, child: Text(text, style: Theme.of(context).textTheme.headline3));
          },
        ),
      ),
    );
  }
}
