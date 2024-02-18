import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portal/auth/providers.dart';
import 'package:portal/image_placeholder.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        return UserAccountsDrawerHeader(
          decoration: const FlutterLogoDecoration(),
          accountName: snapshot.hasData ? Text(snapshot.data!.displayName!) : null,
          accountEmail: MenuAnchor(
            menuChildren: snapshot.hasData
                ? [
                    MenuItemButton(
                      onPressed: FirebaseAuth.instance.signOut,
                      child: const Text("Sign Out"),
                    )
                  ]
                : List.generate(
                    providers.length,
                    (index) => MenuItemButton(
                      trailingIcon: Icon(providers[index].icon),
                      onPressed: () => signInWithFirebaseProvider(providers[index].authProvider),
                      child: Text(providers[index].text),
                    ),
                  ),
            builder: (context, controller, child) => TextButton.icon(
              onPressed: controller.isOpen ? controller.close : controller.open,
              label: snapshot.hasData ? Text(snapshot.data!.email!) : const Text("Sign In"),
              icon:
                  Icon(controller.isOpen ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_down_sharp),
            ),
          ),
          currentAccountPicture: snapshot.hasData
              ? FadeInImage.memoryNetwork(
                  image: snapshot.data!.photoURL!,
                  placeholder: imagePlaceholder,
                )
              : const Icon(Icons.account_box_sharp, size: 72),
        );
      },
    );
  }
}
