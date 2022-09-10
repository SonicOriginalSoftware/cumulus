import 'package:flutter/material.dart';

class CreateWidget extends StatelessWidget {
  const CreateWidget({super.key});
  static String buttonText = 'Create';
  static double formFieldSpacing = 8.0;

  void createRepo() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Repository Path',
                hintText: 'Path of the repository',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: formFieldSpacing),
          ElevatedButton(
            onPressed: createRepo,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
