import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/BrewUtils.dart';
import 'package:ntcbrew/utils/Strings.dart';

class AbvScreen extends StatelessWidget {
  static const route = "/formulas/detail/abv";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.abv_title)),
      ),
      body: AbvCalc(),
    );
  }
}

class AbvCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AbvCalc();
}

class _AbvCalc extends State<AbvCalc> {
  TextEditingController _ogTextController = TextEditingController(text: "0");
  TextEditingController _fgTextController = TextEditingController(text: "0");
  String abv = "-";

  @override
  void initState() {
    super.initState();
    _ogTextController.addListener(_setResult);
    _fgTextController.addListener(_setResult);
  }

  @override
  void dispose() {
    _ogTextController.dispose();
    _fgTextController.dispose();
    super.dispose();
  }

  _setResult() {
    double? og = double.tryParse(_ogTextController.text);
    double? fg = double.tryParse(_fgTextController.text);

    setState(() {
      if (og != null && fg != null) {
        abv = BrewUtils.calcABV(og, fg).toStringAsFixed(2);
      } else {
        abv = "-";
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
        child: FittedBox(fit: BoxFit.scaleDown, child: Text(abv, style: Theme.of(context).textTheme.headline3)),
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
            controller: _ogTextController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Og',
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
