import 'package:flutter/material.dart';

IconThemeData iconTheme = const IconThemeData(
  size: 24,
);

TextStyle textStyle = const TextStyle(
  backgroundColor: Colors.transparent,
  color: Colors.black,
);

TextTheme textTheme = TextTheme(
  labelLarge: textStyle,
  labelMedium: textStyle,
  labelSmall: textStyle,
);

ButtonStyle rectangularButton = OutlinedButton.styleFrom(
  foregroundColor: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.zero),
  ),
);

ButtonStyle elevatedButton = ElevatedButton.styleFrom(
  foregroundColor: Colors.black,
  backgroundColor: Colors.white,
);

ThemeData defaultTheme = ThemeData(
  useMaterial3: true,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: rectangularButton,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButton),
  textTheme: textTheme,
  iconTheme: iconTheme,
);
