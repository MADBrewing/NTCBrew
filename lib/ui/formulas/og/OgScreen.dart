import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class OgScreen extends StatelessWidget {
  static const route = "/formulas/detail/og";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.og_title)),
      ),
    );
  }
}
