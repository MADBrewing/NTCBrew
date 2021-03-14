import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Defs.dart';
import 'package:ntcbrew/utils/Strings.dart';

class EmptyWidget extends StatelessWidget {

  final OnTap _onTap;
  final String? emptyMessage;

  EmptyWidget(this._onTap, {this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(emptyMessage ?? getString(context, (res) => res?.no_data)),
        MaterialButton(onPressed: _onTap)
      ],
    );
  }
}
