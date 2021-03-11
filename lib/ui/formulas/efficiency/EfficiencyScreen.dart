import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/BrewUtils.dart';
import 'package:ntcbrew/utils/Strings.dart';

class EfficiencyScreen extends StatelessWidget {
  static const route = "/formulas/detail/efficiency";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.efficiency_title)),
      ),
      body: EfficiencyCalc(),
    );
  }
}

class EfficiencyCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EfficiencyCalc();
}

class _EfficiencyCalc extends State<EfficiencyCalc> {
  TextEditingController _batchSizeTextController = TextEditingController(text: "0");
  TextEditingController _weightOfMaltTextController = TextEditingController(text: "0");
  TextEditingController _avgExtrTextController = TextEditingController(text: "0");
  TextEditingController _ogTextController = TextEditingController(text: "0");
  String text = "-";

  @override
  void initState() {
    super.initState();
    _batchSizeTextController.addListener(_setResult);
    _weightOfMaltTextController.addListener(_setResult);
    _avgExtrTextController.addListener(_setResult);
    _ogTextController.addListener(_setResult);
  }

  @override
  void dispose() {
    _batchSizeTextController.dispose();
    _weightOfMaltTextController.dispose();
    _avgExtrTextController.dispose();
    _ogTextController.dispose();
    super.dispose();
  }

  _setResult() {
    double? avgExtr = double.tryParse(_avgExtrTextController.text);
    double? weightOfMalt = double.tryParse(_weightOfMaltTextController.text);
    double? batchSize = double.tryParse(_batchSizeTextController.text);
    double? og = double.tryParse(_ogTextController.text);

    setState(() {
      if (batchSize != null && weightOfMalt != null && avgExtr != null && og != null) {
        text = BrewUtils.calcEfficiency(avgExtr, weightOfMalt, batchSize, og).toStringAsFixed(2);
      } else {
        text = "-";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _top(),
        _input("Average Extr", _avgExtrTextController),
        _input("Weight of Malt", _weightOfMaltTextController),
        _input("Batch Size", _batchSizeTextController),
        _input("OG", _ogTextController),
      ],
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

  Widget _input(String label, TextEditingController textEditingController) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: TextFormField(
        controller: textEditingController,
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
