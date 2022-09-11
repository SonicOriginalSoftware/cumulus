import 'package:flutter/material.dart';

class Actions extends StatelessWidget {
  Actions({super.key});

  static const buttonFontStyle = TextStyle(fontSize: 20);
  static const buttonPadding = EdgeInsets.all(24);
  final buttonStyle = OutlinedButton.styleFrom(
    padding: buttonPadding,
  );
  final buttonMap = {
    "Create": Icons.add_circle_outline_sharp,
    "Update": Icons.edit_sharp,
    "Delete": Icons.delete_sharp,
  };

  OutlinedButton createButton(String name, IconData icon) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: buttonStyle,
      label: Text(name, style: buttonFontStyle),
      icon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      itemBuilder: (context, index) {
        final entry = buttonMap.entries.elementAt(index);
        return createButton(entry.key, entry.value);
      },
      itemCount: buttonMap.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.transparent, height: 12),
    );
  }
}
