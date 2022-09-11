import 'package:flutter/material.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  static double formFieldSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Repository Path',
        hintText: 'Path of the repository',
        border: OutlineInputBorder(),
      ),
    );
  }
}
