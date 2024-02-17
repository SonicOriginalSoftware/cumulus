import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<UserCredential?> signInWithFirebaseProvider(AuthProvider provider) async {
  // await FirebaseAuth.instance.signInWithPopup(provider);
  await FirebaseAuth.instance.signInWithRedirect(provider);
  return FirebaseAuth.instance.getRedirectResult();
}

class AuthProviderParameters {
  final String text;
  final IconData icon;
  final AuthProvider authProvider;

  AuthProviderParameters({required this.text, required this.icon, required this.authProvider});
}

final providers = [
  AuthProviderParameters(
      text: "Sign in with Apple", icon: Icons.apple_sharp, authProvider: AppleAuthProvider()),
  AuthProviderParameters(
      text: "Sign in with Google", icon: Icons.abc_sharp, authProvider: GoogleAuthProvider()),
];
