import 'package:flutter/material.dart';
import 'package:portal/code/repository/create.dart';
import 'package:portal/shell/bar/account.dart';
import 'package:portal/shell/bar/home.dart';
import 'package:portal/widgets/options.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static const actions = [
    Account(),
    Options(),
  ];

  @override
  Widget build(BuildContext context) {
    double iconThemeSize = Theme.of(context).iconTheme.size ?? 24;
    double leadingPadding = ((kToolbarHeight - iconThemeSize) / 2) + 8;

    List<Widget> leadingWidgets = [
      Home(padding: leadingPadding),
      Create(padding: leadingPadding),
    ];
    int numLeadingWidgets = leadingWidgets.length;

    double leadingWidth =
        leadingPadding * 2 * numLeadingWidgets + iconThemeSize * numLeadingWidgets;

    return AppBar(
      leadingWidth: leadingWidth,
      leading: Flex(
        direction: Axis.horizontal,
        children: leadingWidgets,
      ),
      actions: actions,
    );
  }
}
