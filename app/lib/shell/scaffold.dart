import 'package:code_repository/nav/drawer.dart';
import 'package:code_repository/shell/bar.dart';
import 'package:code_repository/shell/body.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<StatefulWidget> createState() => AppScaffoldState();
}

class AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Bar(),
      drawer: Nav(),
      body: Body(),
    );
  }
}
