import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<dynamic> deferredConfigure(BuildContext context) async {
  final config = await DefaultAssetBundle.of(context).loadString("config/firebase.json");
  final decodedConfig = jsonDecode(config);

  final FirebaseOptions firebaseOptions = FirebaseOptions(
    apiKey: decodedConfig["apiKey"] as String,
    authDomain: decodedConfig["authDomain"] as String,
    projectId: decodedConfig["projectId"] as String,
    storageBucket: decodedConfig["storageBucket"] as String,
    messagingSenderId: decodedConfig["messagingSenderId"] as String,
    appId: decodedConfig["appId"] as String,
    measurementId: decodedConfig["measurementId"] as String,
  );

  final app = await Firebase.initializeApp(
    options: firebaseOptions,
  );
  return app;
}
