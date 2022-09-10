import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signInWithApple() async {
  AppleAuthProvider appleProvider = AppleAuthProvider();

  // await FirebaseAuth.instance.signInWithPopup(appleProvider);
  await FirebaseAuth.instance.signInWithRedirect(appleProvider);
  return FirebaseAuth.instance.getRedirectResult();
}
