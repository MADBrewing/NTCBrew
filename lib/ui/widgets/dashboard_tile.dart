import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {

  final String title;
  final String subtitle;

  DashboardTile(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline1),
          Text(subtitle, style: Theme.of(context).textTheme.headline5)
        ],
      ),
    );
  }
}