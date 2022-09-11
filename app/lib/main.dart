// ignore: avoid_web_libraries_in_flutter

import 'package:code_repository/auth/firebase.dart';
import 'package:code_repository/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBLB_YlcPtzA_gWNqGS5mzcUr2DZycvn_I",
      authDomain: "sos-authenticate.firebaseapp.com",
      projectId: "sos-authenticate",
      storageBucket: "sos-authenticate.appspot.com",
      messagingSenderId: "1047715899790",
      appId: "1:1047715899790:web:600c0f01b00f6fab589cdf",
      measurementId: "G-BTQTQKGQS4",
    ),
  );

  FirebaseAuth.instance.userChanges().listen(handleUserChange);
  Widget app = build("Code Repository", navigatorKey);

  runApp(app);
}
