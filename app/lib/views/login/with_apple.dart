import 'package:code_repository/auth/apple/signin.dart';
import 'package:flutter/material.dart';

class SignInWithAppleButton extends StatelessWidget {
  const SignInWithAppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: signInWithApple,
      icon: const Icon(Icons.apple),
      label: const Text('Sign in With Apple'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}
