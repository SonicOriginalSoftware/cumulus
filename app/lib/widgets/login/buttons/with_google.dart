import 'package:code_repository/auth/google/signin.dart';
import 'package:code_repository/widgets/login/buttons/style.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  static const label = "Sign in With Google";
  static const double sz = 18;
  static final icon = Image.asset('images/google.png', width: sz, height: sz);
  static const callback = signInWithGoogle;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: const Text(label),
      icon: icon,
      onPressed: callback,
      style: signInButtonStyle,
    );
  }
}
