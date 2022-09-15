import 'package:code_repository/shell/body.dart';
import 'package:code_repository/views/create/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  const Create({super.key, this.padding});

  final double? padding;

  static const defaultLabel = "Create";
  static const icon = Icon(Icons.add_circle_sharp);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        final hasData = snapshot.data != null;
        final label = hasData ? defaultLabel : "";
        final callback =
            hasData ? () => bodyController.sink.add(const CreateView()) : null;

        return IconButton(
          icon: icon,
          onPressed: callback,
          padding: EdgeInsets.all(padding ?? 8),
          tooltip: label,
        );
      },
    );
  }
}
