import 'package:code_repository/shell/bar/display.dart';
import 'package:code_repository/shell/body.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Bar(),
      body: Body(),
    );
  }
}
