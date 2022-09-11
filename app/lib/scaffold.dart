import 'package:code_repository/bar.dart';
import 'package:code_repository/body.dart';
import 'package:code_repository/keys.dart';
import 'package:code_repository/nav/drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<StatefulWidget> createState() => AppScaffoldState();
}

class AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const Bar(),
      drawer: const Nav(),
      // bottomNavigationBar: const app_nav.Navigator(),
      body: const Body(),
    );
  }
}
