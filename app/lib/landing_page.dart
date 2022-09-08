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
            textStyle: const TextStyle(fontSize: 20),
            padding: const EdgeInsets.all(20.0),
            onPrimary: Theme.of(context).colorScheme.secondaryContainer,
            primary: Theme.of(context).colorScheme.onSecondaryContainer,
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
