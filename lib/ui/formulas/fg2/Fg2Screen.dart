import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class Fg2Screen extends StatelessWidget {
  static const route = "/formulas/detail/fg2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.fg2_title)),
      ),
    );
  }
}
