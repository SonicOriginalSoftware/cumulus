import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  static const accountIcon = Icon(Icons.account_box_sharp);

  @override
  Widget build(BuildContext context) {
    final userDisplay = StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        final hasData = snapshot.data != null;
        return hasData
            ? Center(
                child: Text(
                snapshot.data?.displayName ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))
            : const SizedBox();
      },
    );

    return userDisplay;
  }
}
