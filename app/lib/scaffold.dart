import 'package:code_repository/bar.dart';
import 'package:code_repository/body.dart';
import 'package:code_repository/drawer.dart';
import 'package:code_repository/keys.dart';
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
      drawer: const Pullout(),
      body: const Body(),
    );
  }
}
