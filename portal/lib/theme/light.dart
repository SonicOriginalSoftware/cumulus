import 'package:flutter/material.dart';

const Color transparent = Colors.transparent;
const Color background = Colors.white;
const Color primary = Colors.black;

const TextStyle lightTextStyle = TextStyle(
  backgroundColor: transparent,
  color: primary,
);

const TextTheme lightTextTheme = TextTheme(
  labelLarge: lightTextStyle,
  labelMedium: lightTextStyle,
  labelSmall: lightTextStyle,
);

const ColorScheme lightColorScheme = ColorScheme.light(
  background: background,
  onBackground: primary,
  primary: primary,
);

final ThemeData lightTheme = ThemeData.from(
  colorScheme: lightColorScheme,
  textTheme: lightTextTheme,
);
