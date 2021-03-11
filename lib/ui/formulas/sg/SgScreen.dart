import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class SgScreen extends StatelessWidget {
  static const route = "/formulas/detail/sg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.sg_title)),
      ),
    );
  }
}
