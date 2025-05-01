import 'package:easy_flutter_boilerplate/app/core/styles/theme.dart';
import 'package:easy_flutter_boilerplate/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: themeData,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
    );
  }
}
