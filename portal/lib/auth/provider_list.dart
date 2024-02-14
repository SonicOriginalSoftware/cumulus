import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portal/themes/button_style.dart';

Future<UserCredential?> signInWithFirebaseProvider(AuthProvider provider) async {
  // await FirebaseAuth.instance.signInWithPopup(provider);
  await FirebaseAuth.instance.signInWithRedirect(provider);
  return FirebaseAuth.instance.getRedirectResult();
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.apple_sharp),
            label: const Text("Sign in With Apple"),
            onPressed: () => signInWithFirebaseProvider(AppleAuthProvider()),
            style: defaultButtonStyle,
          ),
          const Divider(color: Colors.transparent),
          TextButton.icon(
            icon: const Icon(Icons.abc),
            label: const Text("Sign in With Google"),
            onPressed: () => signInWithFirebaseProvider(GoogleAuthProvider()),
            style: defaultButtonStyle,
          ),
        ],
      ),
    );
  }
}
