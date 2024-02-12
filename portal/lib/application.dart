import 'package:flutter/material.dart';
import 'package:portal/bundle.dart';
import 'package:portal/configure.dart';
import 'package:portal/shell/desktop.dart';
import 'package:portal/shell/mobile.dart';
import 'package:portal/theme/dark.dart';
import 'package:portal/theme/light.dart';

class Application extends StatelessWidget {
  final String title;
  static const widthBreakpoint = 600;

  const Application({super.key, required this.title});

  Widget buildConfiguredApp(BuildContext context, BoxConstraints constraints) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: DefaultAssetBundle(
          bundle: DefaultBundle(),
          child: FutureBuilder(
              future: deferredConfigure(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return constraints.maxWidth > widthBreakpoint ? const Desktop() : const Mobile();
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: buildConfiguredApp,
    );
  }
}
