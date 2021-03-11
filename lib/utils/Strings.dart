import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getString(BuildContext context, Function(AppLocalizations?) res) {
  return res(AppLocalizations.of(context)) ?? "";
}