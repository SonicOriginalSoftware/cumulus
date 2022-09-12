import 'package:code_repository/widgets/auth/account.dart';
import 'package:code_repository/widgets/auth/create.dart';
import 'package:code_repository/widgets/home.dart';
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
        Home(),
      ],
    );
  }
}
