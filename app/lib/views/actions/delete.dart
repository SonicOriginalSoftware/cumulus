import 'package:flutter/material.dart';

class DeleteWidget extends StatelessWidget {
  const DeleteWidget({super.key});
  static String buttonText = 'Delete';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(buttonText),
    );
  }
}
