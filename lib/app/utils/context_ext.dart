import 'package:easy_flutter_boilerplate/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  AppLocalizations get localized {
    return AppLocalizations.of(this)!;
  }

  ColorScheme get color => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
