import 'package:flutter/material.dart';
import 'package:portal/bar.dart';
import 'package:portal/bundle.dart';
import 'package:portal/configure.dart';
import 'package:portal/themes/dark.dart';
import 'package:portal/themes/light.dart';

class Application extends StatelessWidget {
  final String title;

  const Application({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
                if (snapshot.connectionState == ConnectionState.done) {
                  return const Scaffold(
                    appBar: Bar(),
                    body: Material(),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final backgroundColor = Theme.of(context).dialogBackgroundColor;
                  final valueColor = Theme.of(context).focusColor;
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: backgroundColor,
                    valueColor: AlwaysStoppedAnimation(valueColor),
                  ));
                }
              }),
        ));
  }
}
