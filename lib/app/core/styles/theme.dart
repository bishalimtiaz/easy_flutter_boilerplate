import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/core/styles/colors.dart';
import 'package:easy_flutter_boilerplate/app/core/styles/text_styles.dart';

final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    surface: backgroundColor,
  ),
  textTheme: const TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
  ),
);
