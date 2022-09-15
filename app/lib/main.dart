import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'application.dart';

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

  Application app = const Application(title: "Code Repository");

  runApp(app);
}
