// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:code_repository/auth/token.dart';
import 'package:code_repository/navigator.dart';
import 'package:code_repository/views/actions.dart' as app_actions;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void handleUserChange(User? user) {
  if (user != null) {
    window.console.log("User: $user");

    AuthToken token = AuthToken(user);
    MaterialPageRoute route = MaterialPageRoute(
        builder: (context) => app_actions.Actions(token: token));

    navigatorKey.currentState?.push(route);
  }
}
