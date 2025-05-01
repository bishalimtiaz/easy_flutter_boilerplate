import 'package:easy_flutter_boilerplate/app/presentation/styles/colors.dart';
import 'package:easy_flutter_boilerplate/app/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';
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
