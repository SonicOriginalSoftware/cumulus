import 'package:code_repository/shell/bar/widgets/item.dart';
import 'package:code_repository/shell/body.dart';
import 'package:code_repository/views/options/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  static const toolTip = "Options";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        return PopupMenuButton(
          tooltip: toolTip,
          position: PopupMenuPosition.under,
          offset: const Offset(0, 8),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          itemBuilder: (context) => <PopupMenuItem>[
            PopupMenuItem(
              onTap: () => bodyController.sink.add(const OptionsView()),
              padding: EdgeInsets.zero,
              child: const ListItem(
                  title: "Preferences", icon: Icons.settings_sharp),
            ),
            PopupMenuItem(
              onTap: FirebaseAuth.instance.signOut,
              enabled: snapshot.data != null,
              padding: EdgeInsets.zero,
              child:
                  const ListItem(title: "Sign out", icon: Icons.logout_sharp),
            ),
          ],
        );
      },
    );
  }
}
