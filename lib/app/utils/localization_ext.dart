import 'package:easy_flutter_boilerplate/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localized {
    return AppLocalizations.of(this)!;
  }
}
