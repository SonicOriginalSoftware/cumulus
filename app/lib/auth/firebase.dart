// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:code_repository/auth/constants.dart';
import 'package:code_repository/bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void handleUserChange(User? user) {
  if (user != null) {
    window.console.log("User: $user");

    authenticationStatus = Icons.logout_sharp;
    toolTip = logoutText;

    // AuthToken token = AuthToken(user);
    // MaterialPageRoute route =
    //     MaterialPageRoute(builder: (context) => const app_actions.Actions());

    // navigatorKey.currentState?.push(route);
  } else {
    authenticationStatus = Icons.login_sharp;
    toolTip = loginText;
  }
}
