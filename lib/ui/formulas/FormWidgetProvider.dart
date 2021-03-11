import 'package:flutter/material.dart';

class FormWidgetProvider {
  Input og(BuildContext context) => Input("OG", FormulaInputType.OG);

  Input fg(BuildContext context) => Input("FG", FormulaInputType.FG);

  Input batchSize(BuildContext context) => Input("Batch Size", FormulaInputType.BATCH_SIZE);

  Input plato(BuildContext context) => Input("Plato", FormulaInputType.PLATO);

  Input brixStart(BuildContext context) => Input("Brix Start", FormulaInputType.BRIX_START);

  Input weightOfMalt(BuildContext context) => Input("Weight of Malt", FormulaInputType.WEIGHT_OF_MALT);

  Input avgMaltEBC(BuildContext context) => Input("Average Malt EBC", FormulaInputType.AVG_MALT_EBC);

  Input avgExtr(BuildContext context) => Input("Average Extr", FormulaInputType.AVG_EXTR);

  List<Input> getEpmMenu(BuildContext context) => [batchSize(context), plato(context)];
}

class Input extends StatelessWidget {
  final TextEditingController textController = TextEditingController(text: "0");
  final String label;
  final FormulaInputType type;

  Input(this.label, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

enum FormulaInputType { OG, FG, BATCH_SIZE, PLATO, BRIX_START, WEIGHT_OF_MALT, AVG_MALT_EBC, AVG_EXTR }
