import 'package:code_repository/auth/token.dart';
import 'package:flutter/material.dart';

import 'actions/create.dart';
import 'actions/delete.dart';
import 'actions/update.dart';

const double _buttonPadding = 40;
const EdgeInsets buttonPadding = EdgeInsets.all(_buttonPadding);

class Actions extends StatelessWidget {
  const Actions({super.key, required this.token});
  static double buttonInsets = 8.0;
  static double buttonExtents = 8.0;
  final AuthToken token;

  @override
  Widget build(BuildContext context) {
    const buttons = [
      CreateWidget(),
      UpdateWidget(),
      DeleteWidget(),
    ];
    return Scaffold(
      body: ListView.separated(
        padding: buttonPadding,
        itemCount: buttons.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.transparent,
        ),
        itemBuilder: (context, index) => buttons[index],
        // children: buttons,
      ),
    );
  }
}
