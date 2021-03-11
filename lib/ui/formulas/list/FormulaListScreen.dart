import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/list/MenuItemProvider.dart';

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
  var _menuItemProvider = MenuItemProvider();
  late List<MenuItem> _menu;

  @override
  void initState() {
    _menu = _menuItemProvider.getMenuItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: _menu.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_menu[index].name), onTap: () => _onItemTapped(context, index));
        });
  }

  void _onItemTapped(BuildContext context, int index) {
    Navigator.of(context).pushNamed(_menu[index].path);
  }
}
