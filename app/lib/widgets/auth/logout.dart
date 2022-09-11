import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.data != null) {
          return IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: FirebaseAuth.instance.signOut,
            tooltip: "Log out",
          );
        }

        return const SizedBox();
      },
    );
  }
}
