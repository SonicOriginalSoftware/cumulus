import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  static const accountIcon = Icon(Icons.account_box_sharp);

  @override
  Widget build(BuildContext context) {
    final userDisplay = StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        final hasData = snapshot.data != null;
        return hasData
            ? Row(
                children: [
                  accountIcon,
                  Text(snapshot.data?.displayName ?? ""),
                ],
              )
            : const SizedBox();
      },
    );

    return userDisplay;
  }
}
