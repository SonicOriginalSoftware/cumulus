import 'package:code_repository/widgets/login/buttons/with_apple.dart';
import 'package:code_repository/widgets/login/buttons/with_google.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SignInWithAppleButton(),
          Divider(color: Colors.transparent),
          SignInWithGoogleButton(),
        ],
      ),
    );
  }
}
