import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  Logout({super.key});

  static const signOut = "Sign Out";
  static const accountToolTip = "Account Options";
  final callback = FirebaseAuth.instance.signOut;
  static const logoutIcon = Icon(Icons.logout_sharp);

  @override
  Widget build(BuildContext context) {
    const logoutButton = ListTile(
      leading: logoutIcon,
      title: Text(signOut),
    );

    final logout = StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.data == null) {
          return const SizedBox();
        }

        return PopupMenuButton(
          tooltip: accountToolTip,
          position: PopupMenuPosition.under,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: callback,
              child: logoutButton,
            )
          ],
        );
      },
    );

    return logout;
  }
}
