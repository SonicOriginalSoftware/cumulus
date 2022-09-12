import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  static const logoutIcon = Icon(Icons.logout_sharp);

  @override
  Widget build(BuildContext context) {
    final logout = StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        const signOut = "Sign Out";
        final hasData = snapshot.data != null;
        final accountToolTip = hasData ? "Account Options" : "";
        final callback = hasData ? FirebaseAuth.instance.signOut : null;

        const logoutButton = ListTile(
          leading: logoutIcon,
          title: Text(signOut),
          // enabled: hasData,
        );

        return PopupMenuButton(
          tooltip: accountToolTip,
          enabled: hasData,
          position: PopupMenuPosition.under,
          // offset: const Offset(0, 4),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          itemBuilder: (context) => [
            PopupMenuItem(
              // enabled: hasData,
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
