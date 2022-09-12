import 'package:code_repository/shell/body.dart';
import 'package:code_repository/views/create/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  static const icon = Icon(Icons.add_circle_sharp);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        final label = snapshot.data == null ? "" : "Create";
        final callback = snapshot.data == null
            ? null
            : () => bodyController.sink.add(const CreateView());

        return IconButton(
          icon: icon,
          onPressed: callback,
          tooltip: label,
        );
      },
    );
  }
}
