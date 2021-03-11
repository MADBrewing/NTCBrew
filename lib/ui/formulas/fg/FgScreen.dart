import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class FgScreen extends StatelessWidget {
  static const route = "/formulas/detail/fg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.fg_title)),
      ),
    );
  }
}
