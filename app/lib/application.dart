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
        Widget home = constraints.maxWidth > widthBreakpoint
            ? const Desktop()
            : const Mobile();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: home,
        );
      }),
    );
  }
}
