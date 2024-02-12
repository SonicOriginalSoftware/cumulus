import 'package:flutter/material.dart';
import 'package:portal/auth/google.dart';
import 'package:portal/widgets/login/buttons/style.dart';

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
