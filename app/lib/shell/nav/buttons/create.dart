import 'package:code_repository/shell/nav/callback.dart';
import 'package:code_repository/shell/nav/style.dart';
import 'package:code_repository/views/create/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  static const label = "Create";
  static const icon = Icon(Icons.add_circle_outline_sharp);
  static const selectedIcon = Icon(Icons.add_circle_sharp);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        void Function()? callback;
        if (snapshot.data != null) {
          callback = () => drawerPressCallback(const CreateView(), context);
        }

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
