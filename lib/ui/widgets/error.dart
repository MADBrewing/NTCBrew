import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Defs.dart';
import 'package:ntcbrew/utils/Strings.dart';

class NtcErrorWidget extends StatelessWidget {

  final OnTap _onTap;
  final String? errorMessage;

  NtcErrorWidget(this._onTap, {this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.error),
        Text(errorMessage ?? getString(context, (res) => res?.error)),
        MaterialButton(onPressed: _onTap)
      ],
    );
  }
}
