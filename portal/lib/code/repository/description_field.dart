import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Description',
          hintText: 'Description of the repository',
        ),
      ),
    );
  }
}
