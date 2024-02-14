import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portal/themes/button_style.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({super.key});

  @override
  State<AuthButton> createState() => AuthState();
}

class AuthState extends State<AuthButton> {
  Future<void> Function()? _authenticateCallback;

  Future<void> Function()? get authenticateCallback {
    return _authenticateCallback;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          final authenticateStatusIcon = snapshot.hasData ? Icons.logout_sharp : Icons.login_sharp;
          final authenticateStatusText = snapshot.hasData ? "Sign Out" : "Sign In";
          _authenticateCallback = snapshot.hasData ? FirebaseAuth.instance.signOut : null;

          return TextButton.icon(
              onPressed: _authenticateCallback,
              style: defaultButtonStyle,
              icon: Icon(authenticateStatusIcon),
              label: Text(authenticateStatusText));
        });
  }
}
