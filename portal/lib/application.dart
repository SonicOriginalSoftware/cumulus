import 'package:code_repository/configure.dart';
import 'package:code_repository/shell/desktop.dart';
import 'package:code_repository/shell/mobile.dart';
import 'package:code_repository/theme/dark.dart';
import 'package:code_repository/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    return await rootBundle.load(key);
  }
}

class Application extends StatelessWidget {
  const Application({super.key, required this.title});

  final String title;

  static const widthBreakpoint = 600;

  Widget buildConfiguredApp(BuildContext context, BoxConstraints constraints) {
    final home = constraints.maxWidth > widthBreakpoint
        ? const Desktop()
        : const Mobile();
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
                  return home;
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
