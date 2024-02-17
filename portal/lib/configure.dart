import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> loadFirebaseConfig(AssetBundle bundle) async {
  // await Future.delayed(const Duration(seconds: 3));
  final firebaseConfig = await bundle.loadString("config/firebase.json");
  final decodedFirebaseConfig = jsonDecode(firebaseConfig);

  final FirebaseOptions firebaseOptions = FirebaseOptions(
    apiKey: decodedFirebaseConfig["apiKey"] as String,
    authDomain: decodedFirebaseConfig["authDomain"] as String,
    projectId: decodedFirebaseConfig["projectId"] as String,
    storageBucket: decodedFirebaseConfig["storageBucket"] as String,
    messagingSenderId: decodedFirebaseConfig["messagingSenderId"] as String,
    appId: decodedFirebaseConfig["appId"] as String,
    measurementId: decodedFirebaseConfig["measurementId"] as String,
  );

  final app = await Firebase.initializeApp(options: firebaseOptions);
  app.setAutomaticDataCollectionEnabled(false);
}

Future<void> deferredConfigure(BuildContext context) {
  final assetBundle = DefaultAssetBundle.of(context);
  return loadFirebaseConfig(assetBundle);
}
