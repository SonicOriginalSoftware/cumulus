import 'package:code_repository/shell/nav/callback.dart';
import 'package:code_repository/shell/nav/style.dart';
import 'package:code_repository/views/delete/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Delete extends StatelessWidget {
  const Delete({super.key});

  static const label = "Delete";
  static const icon = Icon(Icons.delete_outline_sharp);
  static const selectedIcon = Icon(Icons.delete_sharp);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        final callback = snapshot.data == null
            ? null
            : () => drawerPressCallback(const DeleteView(), context);

        return TextButton.icon(
          label: const Text(label),
          icon: icon,
          style: navBarButtonStyle,
          // selectedIcon: selectedIcon,
          onPressed: callback,
        );
      },
    );
  }
}
