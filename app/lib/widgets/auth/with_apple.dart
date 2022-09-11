import 'package:code_repository/auth/apple/signin.dart';
import 'package:code_repository/widgets/auth/style.dart';
import 'package:flutter/material.dart';

class SignInWithAppleButton extends StatelessWidget {
  const SignInWithAppleButton({super.key});

  static const label = "Sign in With Apple";
  static const icon = Icon(Icons.apple);
  static const callback = signInWithApple;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon,
      label: const Text(label),
      onPressed: callback,
      style: signInButtonStyle,
    );
  }
}
