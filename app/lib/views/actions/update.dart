import 'package:flutter/material.dart';

class UpdateWidget extends StatelessWidget {
  const UpdateWidget({super.key});
  static String buttonText = 'Update';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(buttonText),
    );
  }
}
