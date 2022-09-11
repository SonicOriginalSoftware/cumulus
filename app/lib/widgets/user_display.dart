import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDisplay extends StatelessWidget {
  const UserDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        String title = snapshot.data?.displayName ?? "";

        return Center(child: Text(title));
      },
    );
  }
}
