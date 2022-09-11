import 'package:flutter/material.dart';

TextStyle lightTextStyle = const TextStyle(
  backgroundColor: Colors.transparent,
  color: Colors.black,
);

TextTheme lightTextTheme = TextTheme(
  labelLarge: lightTextStyle,
  labelMedium: lightTextStyle,
  labelSmall: lightTextStyle,
);

ColorScheme lightColorScheme = const ColorScheme.light(
    // background: Colors.white,
    // onBackground: Colors.black,
    );
