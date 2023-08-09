import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/src/core/l10n/generated/l10n.dart';

class L10n {
  const L10n();
  static S get current => S.current;
  static S of(BuildContext context) => S.of(context);
  static List<Locale> get supportedLocales => S.delegate.supportedLocales;

  static const List<LocalizationsDelegate> delegates = <LocalizationsDelegate>[
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
