import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/BrewUtils.dart';
import 'package:ntcbrew/utils/Strings.dart';

class EbcScreen extends StatelessWidget {
  static const route = "/formulas/detail/ebc";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.ebc_title)),
      ),
      body: EbcCalc(),
    );
  }
}

class EbcCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EbcCalc();
}

class _EbcCalc extends State<EbcCalc> {
  TextEditingController _batchSizeTextController = TextEditingController(text: "0");
  TextEditingController _weightOfMaltTextController = TextEditingController(text: "0");
  TextEditingController _avgMaltEBCTextController = TextEditingController(text: "0");
  String ebc = "-";

  @override
  void initState() {
    super.initState();
    _batchSizeTextController.addListener(_setResult);
    _weightOfMaltTextController.addListener(_setResult);
    _avgMaltEBCTextController.addListener(_setResult);
  }

  @override
  void dispose() {
    _batchSizeTextController.dispose();
    _weightOfMaltTextController.dispose();
    _avgMaltEBCTextController.dispose();
    super.dispose();
  }

  _setResult() {
    double? batchSize = double.tryParse(_batchSizeTextController.text);
    double? weightOfMalt = double.tryParse(_weightOfMaltTextController.text);
    double? avgMaltEBC = double.tryParse(_avgMaltEBCTextController.text);

    setState(() {
      if (batchSize != null && weightOfMalt != null && avgMaltEBC != null) {
        ebc = BrewUtils.calcEBC(batchSize, weightOfMalt, avgMaltEBC).toStringAsFixed(2);
      } else {
        ebc = "-";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_top(), _form()],
    );
  }

  Widget _top() {
    return Container(
      padding: const EdgeInsets.all(32),
      height: 200,
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(fit: BoxFit.scaleDown, child: Text(ebc, style: Theme.of(context).textTheme.headline3)),
      ),
    );
  }

  Widget _form() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: ListView(
        shrinkWrap: true,
        children: [
          TextFormField(
            controller: _batchSizeTextController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Batch Size',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _weightOfMaltTextController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Weight of Malt',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _avgMaltEBCTextController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Average Malt EBC',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
