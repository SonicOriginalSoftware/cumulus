import 'package:flutter/material.dart';
import 'package:portal/auth/apple.dart';
import 'package:portal/widgets/login/buttons/style.dart';

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
