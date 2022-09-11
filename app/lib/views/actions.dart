import 'package:flutter/material.dart';

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonFontStyle = TextStyle(fontSize: 20);
    const buttonPadding = EdgeInsets.all(24);
    final buttonStyle = OutlinedButton.styleFrom(
      padding: buttonPadding,
    );

    final buttons = [
      OutlinedButton.icon(
        onPressed: () {},
        style: buttonStyle,
        label: const Text("Create", style: buttonFontStyle),
        icon: const Icon(Icons.add_circle_outline_sharp),
      ),
      OutlinedButton.icon(
        onPressed: () {},
        style: buttonStyle,
        label: const Text("Update", style: buttonFontStyle),
        icon: const Icon(Icons.edit_sharp),
      ),
      OutlinedButton.icon(
        onPressed: () {},
        style: buttonStyle,
        label: const Text("Delete", style: buttonFontStyle),
        icon: const Icon(Icons.delete_sharp),
      ),
    ];
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      itemBuilder: (context, index) => buttons[index],
      itemCount: buttons.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.transparent, height: 12),
    );
  }
}
