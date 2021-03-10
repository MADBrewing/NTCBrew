import 'package:flutter/material.dart';
import 'package:ntcbrew/routes.dart';
import 'package:ntcbrew/ui/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates, // Add this line
      supportedLocales: AppLocalizations.supportedLocales, // Add this line
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: routes,
    );
  }
}