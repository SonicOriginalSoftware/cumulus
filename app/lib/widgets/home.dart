import 'package:code_repository/shell/body.dart';
import 'package:code_repository/views/home/form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const label = "Go Home";
  static const icon = Icon(Icons.home_sharp);

  callback() => bodyController.sink.add(const HomeView());

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: callback,
      tooltip: label,
    );
  }
}
