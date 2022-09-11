import 'package:code_repository/constants.dart';
import 'package:code_repository/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Pullout extends StatefulWidget {
  const Pullout({super.key});

  @override
  State<StatefulWidget> createState() => PulloutState();
}

class PulloutState extends State<Pullout> {
  @override
  Widget build(BuildContext context) {
    final closeButton = IconButton(
      padding: appBarButtonPadding,
      onPressed: () => scaffoldKey.currentState?.closeDrawer(),
      icon: const Icon(Icons.close),
    );

    final drawerColumn = StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        List<Widget> children = [
          closeButton,
        ];

        if (snapshot.data != null) {
          // children.add(app_actions.Actions());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: children,
        );
      },
    );

    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: drawerColumn,
    );
  }
}
