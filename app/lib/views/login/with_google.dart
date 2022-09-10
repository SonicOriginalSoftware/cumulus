import 'package:code_repository/auth/google/signin.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: signInWithGoogle,
      icon: Image.asset(
        'images/google.png',
        width: IconTheme.of(context).size,
        height: IconTheme.of(context).size,
      ),
      label: const Text("Sign in with Google"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}
