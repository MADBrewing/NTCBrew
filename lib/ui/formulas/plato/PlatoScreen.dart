import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class PlatoScreen extends StatelessWidget {
  static const route = "/formulas/detail/plato";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.plato_title)),
      ),
    );
  }
}
