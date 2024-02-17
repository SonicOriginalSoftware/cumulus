import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portal/auth/providers.dart';
import 'package:portal/image_placeholder.dart';

typedef Scope = Map<String, bool>;

class Account {
  String? username;
  String? displayName;
  ByteData? avatar;

  final Scope scopes = {};
}

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        return UserAccountsDrawerHeader(
          accountName: snapshot.hasData ? Text(snapshot.data!.displayName!) : null,
          accountEmail: snapshot.hasData
              ? Text(snapshot.data!.email!)
              : MenuAnchor(
                  builder: (context, controller, child) => IconButton(
                    onPressed: controller.isOpen ? controller.close : controller.open,
                    icon: const Icon(Icons.arrow_drop_down_sharp),
                  ),
                  // Replace me with List Generator that provides MenuItemButtons for the
                  // login providers
                  menuChildren: List.generate(
                      providers.length,
                      (index) => MenuItemButton(
                            onPressed: null,
                            child: TextButton.icon(
                                onPressed: () =>
                                    signInWithFirebaseProvider(providers[index].authProvider),
                                icon: Icon(providers[index].icon),
                                label: Text(providers[index].text)),
                          )),
                ),
          decoration: const FlutterLogoDecoration(),
          currentAccountPictureSize: const Size.square(64),
          currentAccountPicture: snapshot.hasData
              ? FadeInImage.memoryNetwork(
                  image: snapshot.data!.photoURL!,
                  placeholder: imagePlaceholder,
                )
              : const Icon(Icons.account_box_sharp, size: 64),
        );
      },
    );
  }
}
