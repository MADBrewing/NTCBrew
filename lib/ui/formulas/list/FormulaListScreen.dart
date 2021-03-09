import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormulaListScreen extends StatelessWidget {
  static const route = "/formulas/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormulasList(),
    );
  }
}

class FormulasList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormulasListState();
}

class _FormulasListState extends State<FormulasList> {
  var _items = ["ABV", "Brix", "EBC", "Efficiency", "EPM", "FG", "FG2", "OG", "Plato", "SG"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: _items.length,
        itemBuilder: (context, index) {
      return ListTile(
        title: Text(_items[index]),
      );
    });
  }
}
