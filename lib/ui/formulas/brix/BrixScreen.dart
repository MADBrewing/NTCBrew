import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/BrewUtils.dart';
import 'package:ntcbrew/utils/Strings.dart';

class BrixScreen extends StatelessWidget {
  static const route = "/formulas/detail/brix";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.brix_title)),
      ),
      body: BrixCalc(),
    );
  }
}

class BrixCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BrixCalc();
}

class _BrixCalc extends State<BrixCalc> {
  TextEditingController _brixStartTextController = TextEditingController(text: "0");
  TextEditingController _fgTextController = TextEditingController(text: "0");
  String brixEnd = "-";

  @override
  void initState() {
    super.initState();
    _brixStartTextController.addListener(_setResult);
    _fgTextController.addListener(_setResult);
  }

  @override
  void dispose() {
    _brixStartTextController.dispose();
    _fgTextController.dispose();
    super.dispose();
  }

  _setResult() {
    double? brixStart = double.tryParse(_brixStartTextController.text);
    double? fg = double.tryParse(_fgTextController.text);

    setState(() {
      if (brixStart != null && fg != null) {
        brixEnd = BrewUtils.calcBrixEnd(brixStart, fg).toStringAsFixed(2);
      } else {
        brixEnd = "-";
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
        child: FittedBox(fit: BoxFit.scaleDown, child: Text(brixEnd, style: Theme.of(context).textTheme.headline3)),
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
            controller: _brixStartTextController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Brix Start',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _fgTextController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Fg',
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
