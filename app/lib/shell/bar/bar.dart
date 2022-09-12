import 'package:code_repository/shell/bar/buttons/create.dart';
import 'package:code_repository/shell/bar/buttons/home.dart';
import 'package:code_repository/shell/bar/widgets/account.dart';
import 'package:code_repository/shell/bar/widgets/logout.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Create(),
        Account(),
        Logout(),
        Home(),
      ],
    );
  }
}
