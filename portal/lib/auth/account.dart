import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

typedef Scope = Map<String, bool>;

class Account {
  String? username;
  String? displayName;
  ByteData? avatar;

  final Scope scopes = {};
}

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  static const accountIcon = Icon(Icons.account_box_sharp);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
  }
}
