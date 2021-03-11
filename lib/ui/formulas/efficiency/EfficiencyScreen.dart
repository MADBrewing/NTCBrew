import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class EfficiencyScreen extends StatelessWidget {
  static const route = "/formulas/detail/efficiency";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.efficiency_title)),
      ),
    );
  }
}
