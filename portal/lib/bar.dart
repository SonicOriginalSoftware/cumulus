import 'package:flutter/material.dart';
import 'package:portal/auth/button.dart';
import 'package:portal/themes/button_style.dart';

const widthBreakpoint = 600;

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const preferencesPressed = null;
    final authState = GlobalKey<AuthState>();

    const authButton = AuthButton();
    final preferencesButton = TextButton.icon(
        onPressed: preferencesPressed,
        style: defaultButtonStyle,
        icon: const Icon(Icons.settings_sharp),
        label: const Text("Preferences"));

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.home_sharp),
        style: defaultButtonStyle,
        onPressed: null,
        tooltip: "Go Home",
      ),
      actions: MediaQuery.sizeOf(context).width > widthBreakpoint
          ? [authButton, preferencesButton]
          : [
              PopupMenuButton(
                tooltip: "More",
                position: PopupMenuPosition.under,
                offset: const Offset(0, 8),
                itemBuilder: (context) => <PopupMenuItem>[
                  PopupMenuItem(
                      enabled: authState.currentState?.authenticateCallback != null,
                      child: authButton),
                  PopupMenuItem(
                      onTap: preferencesPressed,
                      enabled: preferencesPressed != null,
                      child: preferencesButton),
                ],
              ),
            ],
    );
  }
}
