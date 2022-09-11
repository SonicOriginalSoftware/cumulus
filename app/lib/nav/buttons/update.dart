import 'package:code_repository/body.dart';
import 'package:code_repository/nav/style.dart';
import 'package:code_repository/views/update/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  const Update({super.key});

  static const label = "Update";
  static const icon = Icon(Icons.edit_outlined);
  static const selectedIcon = Icon(Icons.edit_sharp);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        void Function()? callback;
        if (snapshot.data != null) {
          callback = () => bodyController.sink.add(const UpdateView());
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
