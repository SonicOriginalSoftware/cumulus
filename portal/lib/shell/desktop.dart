import 'package:flutter/material.dart';
import 'package:portal/shell/bar.dart';
import 'package:portal/shell/body.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Bar(),
      body: Body(),
    );
  }
}
