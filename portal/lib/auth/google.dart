import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithGoogle() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  // googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  // googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

  // return FirebaseAuth.instance.signInWithPopup(googleProvider);
  await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  return FirebaseAuth.instance.getRedirectResult();
}
