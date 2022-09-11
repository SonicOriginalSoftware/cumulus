import 'package:code_repository/scaffold.dart';
import 'package:code_repository/theme/default.dart';
import 'package:code_repository/views/login/login.dart';
import 'package:flutter/material.dart';

MaterialApp build(String title, GlobalKey<NavigatorState> navigatorKey) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    // debugShowMaterialGrid: true,
    navigatorKey: navigatorKey,
    title: title,
    theme: defaultTheme,
    themeMode: ThemeMode.system,
    home: const AppScaffold(body: LoginView()),
  );
}
