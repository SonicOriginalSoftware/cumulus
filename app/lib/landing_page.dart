import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: const Text(title),
      //   backgroundColor: Colors.purple,
      // ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            textStyle: const TextStyle(fontSize: 20),
            padding: const EdgeInsets.all(20.0),
            shape: const StadiumBorder(),
          ).copyWith(
            elevation: ButtonStyleButton.allOrNull(0.0),
          ),
          onPressed: () => {},
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
