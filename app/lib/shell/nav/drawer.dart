import 'package:code_repository/shell/nav/buttons/create.dart';
import 'package:code_repository/shell/nav/buttons/delete.dart';
import 'package:code_repository/shell/nav/buttons/home.dart';
import 'package:code_repository/shell/nav/buttons/update.dart';
import 'package:code_repository/widgets/user_display.dart';
import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.10,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
              ),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: const UserDisplay(),
            ),
          ),
          const Divider(),
          const Home(),
          const Divider(),
          const Create(),
          const Delete(),
          const Update(),
          const Divider(),
        ],
      ),
    );
  }
}
