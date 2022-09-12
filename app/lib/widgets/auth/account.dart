import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  static const icon = Icon(Icons.logout_sharp);
  static const accountIcon = Icon(Icons.account_box_sharp);
  static const signOutToolTip = "Sign Out";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        final hasData = snapshot.data == null;
        final callback = hasData ? null : FirebaseAuth.instance.signOut;
        final label = snapshot.data?.displayName ?? "";

        // final logoutButton = IconButton(
        //   icon: icon,
        //   onPressed: callback,
        //   tooltip: signOutToolTip,
        // );

        return PopupMenuButton(
          tooltip: "Account Options",
          enabled: hasData,
          position: PopupMenuPosition.under,
          // padding: const EdgeInsets.all(8),
          // icon: accountIcon,
          child: Row(
            children: [
              accountIcon,
              Text(label),
            ],
            // style: TextButton.styleFrom(
            //   foregroundColor: Theme.of(context).iconTheme.color,
            // ),
          ),
          onSelected: (value) {},
          itemBuilder: (context) => [
            PopupMenuItem(
              enabled: hasData,
              padding: EdgeInsets.zero,
              onTap: callback,
              child: const Tooltip(message: signOutToolTip, child: icon),
            )
          ],
        );
      },
    );
  }
}
