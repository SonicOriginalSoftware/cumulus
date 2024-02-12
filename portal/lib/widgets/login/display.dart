import 'package:flutter/material.dart';
import 'package:portal/widgets/login/buttons/with_apple.dart';
import 'package:portal/widgets/login/buttons/with_google.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInWithAppleButton(),
          Divider(color: Colors.transparent),
          SignInWithGoogleButton(),
        ],
      ),
    );
  }
}
