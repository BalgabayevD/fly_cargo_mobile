import 'package:flutter/material.dart';
import 'package:fly_cargo/core/l10n/generated/app_localizations.dart';

export 'package:fly_cargo/core/l10n/generated/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

class L10n {
  L10n._();

  static const supportedLocales = [
    Locale('ru'),
    Locale('kk'),
    Locale('en'),
  ];

  static const fallbackLocale = Locale('ru');
}
