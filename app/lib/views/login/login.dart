import 'package:flutter/material.dart';

import 'with_apple.dart';
import 'with_google.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const double _buttonPadding = 40;
  static EdgeInsets buttonPadding = const EdgeInsets.all(_buttonPadding);
  static const buttons = [SignInWithGoogleButton(), SignInWithAppleButton()];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        padding: buttonPadding,
        shrinkWrap: true,
        itemCount: buttons.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.transparent,
        ),
        itemBuilder: (context, index) => Center(child: buttons[index]),
      ),
    );
  }
}
