import 'package:code_repository/auth/constants.dart';
import 'package:code_repository/navigator.dart';
import 'package:flutter/material.dart';

IconData authenticationStatus = Icons.login_sharp;
String toolTip = loginText;

const double leadingWidth = 56;
const double iconSize = 24;
const double actionButtonPadding = (leadingWidth - iconSize) / 2;

AppBar appBar = AppBar(
  leadingWidth: leadingWidth,
  leading: Builder(
    builder: (context) => IconButton(
      icon: const Icon(Icons.menu_sharp),
      onPressed: () => Scaffold.of(context).openDrawer(),
    ),
  ),
  actions: [
    IconButton(
      padding: const EdgeInsets.only(
        left: actionButtonPadding,
        right: actionButtonPadding,
      ),
      onPressed: () =>
          navigatorKey.currentState?.popUntil((route) => route.isFirst),
      icon: Icon(authenticationStatus),
      tooltip: toolTip,
    ),
  ],
);
