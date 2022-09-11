import 'package:code_repository/constants.dart';
import 'package:code_repository/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  const Bar({super.key});

  @override
  BarState createState() => BarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    final drawerButton = IconButton(
      icon: const Icon(Icons.menu_sharp),
      onPressed: () => scaffoldKey.currentState?.openDrawer(),
    );

    final homeButton = IconButton(
      padding: appBarButtonPadding,
      onPressed: () =>
          navigatorKey.currentState?.popUntil((route) => route.isFirst),
      icon: const Icon(Icons.home_sharp),
      tooltip: "Go Home",
    );

    List<Widget> children = [];

    final appBar = StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        children = [];
        String title = "";
        Widget photo = const SizedBox();

        if (snapshot.data != null) {
          if (snapshot.data!.photoURL != null) {
            // photo = Image.network(snapshot.data!.photoURL!);
          }
          final userAction = IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: FirebaseAuth.instance.signOut,
            padding: appBarButtonPadding,
            tooltip: "Log out",
          );

          children.add(userAction);

          title = snapshot.data?.displayName ?? "";
        }

        children.add(homeButton);

        return AppBar(
          leadingWidth: drawerIconSize,
          leading: drawerButton,
          actions: children,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(title), photo],
            ),
          ),
          centerTitle: true,
        );
      },
    );

    return appBar;
  }
}
