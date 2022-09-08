import 'package:flutter/material.dart';

import 'landing_page.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.title}) : super(key: key);

  final String title;

  // Root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Theme.of(context).primaryColor),
      home: const LandingContainer(),
    );
  }
}

class LandingContainer extends StatelessWidget {
  const LandingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}
