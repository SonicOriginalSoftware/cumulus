import 'package:flutter/material.dart';
import 'package:portal/shell/body.dart';
import 'package:portal/views/home/form.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.padding});

  final double? padding;

  static const label = "Go Home";
  static const icon = Icon(Icons.home_sharp);

  callback() => bodyController.sink.add(const HomeView());

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      padding: EdgeInsets.all(padding ?? 8),
      onPressed: callback,
      tooltip: label,
    );
  }
}
