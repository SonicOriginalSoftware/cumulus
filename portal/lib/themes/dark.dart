import 'package:flutter/material.dart';

const Color background = Colors.transparent;
const Color primary = Colors.white;

TextStyle darkTextStyle = const TextStyle(
  backgroundColor: background,
  color: primary,
);

TextTheme darkTextTheme = TextTheme(
  labelLarge: darkTextStyle,
  labelMedium: darkTextStyle,
  labelSmall: darkTextStyle,
);

ColorScheme darkColorScheme = const ColorScheme.dark(
  primary: primary,
);

ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  textTheme: darkTextTheme,
  useMaterial3: true,
);
