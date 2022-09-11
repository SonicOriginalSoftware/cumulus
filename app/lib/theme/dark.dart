import 'package:flutter/material.dart';

TextStyle darkTextStyle = const TextStyle(
  backgroundColor: Colors.transparent,
  color: Colors.white,
);

TextTheme darkTextTheme = TextTheme(
  labelLarge: darkTextStyle,
  labelMedium: darkTextStyle,
  labelSmall: darkTextStyle,
);

ColorScheme darkColorScheme = const ColorScheme.dark();
