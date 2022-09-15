import 'package:code_repository/shell/desktop.dart';
import 'package:code_repository/shell/mobile.dart';
import 'package:code_repository/theme/dark.dart';
import 'package:code_repository/theme/light.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key, required this.title});

  final String title;

  static const widthBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        Widget shell = const Mobile();
        if (constraints.maxWidth > widthBreakpoint) {
          shell = const Desktop();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData.from(
            colorScheme: lightColorScheme,
            textTheme: lightTextTheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.from(
            colorScheme: darkColorScheme,
            textTheme: darkTextTheme,
            useMaterial3: true,
          ),
          home: shell,
        );
      }),
    );
  }
}
