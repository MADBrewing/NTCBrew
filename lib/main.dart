import 'package:flutter/material.dart';
import 'package:ntcbrew/network/repository/BoardRepository.dart';
import 'package:ntcbrew/network/repository/ProfileRepository.dart';
import 'package:ntcbrew/network/service/network/BoardNetworkService.dart';
import 'package:ntcbrew/network/service/network/ProfileNetworkService.dart';
import 'package:ntcbrew/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  MultiProvider provider = MultiProvider(
    providers: [
      Provider<BoardNetworkService>(create: (_) => BoardNetworkService(), lazy: true),
      Provider<BoardRepository>(create: (context) => BoardRepository(Provider.of<BoardNetworkService>(context, listen: false)), lazy: true),
      Provider<ProfileNetworkService>(create: (_) => ProfileNetworkService(), lazy: true),
      Provider<ProfileRepository>(create: (context) => ProfileRepository(Provider.of<ProfileNetworkService>(context, listen: false)), lazy: true),
    ],
    child: MyApp(),
  );
  runApp(provider);
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
      onGenerateRoute: routes,
    );
  }
}