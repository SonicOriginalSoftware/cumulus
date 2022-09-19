import 'package:code_repository/shell/bar/display.dart';
import 'package:code_repository/shell/body.dart';
import 'package:code_repository/shell/drawer/panel.dart';
import 'package:flutter/material.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Bar(),
      body: Flex(
        direction: Axis.horizontal,
        children: const [
          AppPanel(),
          Expanded(flex: 1, child: Body()),
        ],
      ),
    );
  }
}
