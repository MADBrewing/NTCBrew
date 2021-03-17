import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/Strings.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingMessage;

  LoadingWidget({this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(loadingMessage ?? getString(context, (res) => res?.loading)),
        ],
      ),
    );
  }
}
