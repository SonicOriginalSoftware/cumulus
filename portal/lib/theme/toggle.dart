import 'package:flutter/material.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  ThemeState createState() => ThemeState();
}

class ThemeState extends State<ThemeToggle> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: themeMode == ThemeMode.dark,
        activeColor: Theme.of(context).secondaryHeaderColor,
        // onChanged: (e) => setState(() => widget.themeMode = !e ? ThemeMode.light : ThemeMode.dark),
        onChanged: (e) => setState(() {
              print('Enabled: $e');
              themeMode = !e ? ThemeMode.light : ThemeMode.dark;
            }),
        thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
          (Set<MaterialState> states) => Icon(states.contains(MaterialState.selected)
              ? Icons.dark_mode_sharp
              : Icons.light_mode_sharp),
        ));
  }
}
