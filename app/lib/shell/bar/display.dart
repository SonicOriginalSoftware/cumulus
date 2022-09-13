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
      leadingWidth: MediaQuery.of(context).size.width * 0.45,
      leading: Flex(
        direction: Axis.horizontal,
        children: const [
          Home(),
          Create(),
        ],
      ),
      actions: [
        const Account(),
        Logout(),
      ],
    );
  }
}
