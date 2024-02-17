import 'package:flutter/material.dart';

const Color transparent = Colors.transparent;
const Color background = Colors.white;
const Color primary = Colors.black;

TextStyle lightTextStyle = const TextStyle(
  backgroundColor: transparent,
  color: primary,
);

TextTheme lightTextTheme = TextTheme(
  labelLarge: lightTextStyle,
  labelMedium: lightTextStyle,
  labelSmall: lightTextStyle,
);

ColorScheme lightColorScheme = const ColorScheme.light(
  background: background,
  onBackground: primary,
  primary: primary,
);

ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  textTheme: lightTextTheme,
);
