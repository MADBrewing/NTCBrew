import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class EpmScreen extends StatelessWidget {
  static const route = "/formulas/detail/epm";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.epm_title)),
      ),
    );
  }
}
