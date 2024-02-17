import 'package:flutter/material.dart';
import 'package:portal/auth/account.dart';
import 'package:portal/bundle.dart';
import 'package:portal/configure.dart';
import 'package:portal/themes/dark.dart';
import 'package:portal/themes/light.dart';

class Application extends StatelessWidget {
  final String title;

  const Application({super.key, required this.title});

  Widget buildBody(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return const Material();
    } else if (snapshot.hasError) {
      return Center(child: Text(snapshot.error.toString()));
    } else {
      final backgroundColor = Theme.of(context).dialogBackgroundColor;
      final valueColor = Theme.of(context).focusColor;
      return Center(
          child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation(valueColor),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: DefaultAssetBundle(
          bundle: DefaultBundle(),
          child: FutureBuilder(
              future: deferredConfigure(context),
              builder: (context, snapshot) {
                return Scaffold(
                  appBar: AppBar(
                    actions: [
                      MenuAnchor(
                        builder: (context, controller, child) => IconButton(
                          onPressed: controller.isOpen ? controller.close : controller.open,
                          icon: const Icon(Icons.more_vert_sharp),
                        ),
                        menuChildren: <Widget>[
                          MenuItemButton(
                            child: const Text("About"),
                            onPressed: () => showAboutDialog(
                              context: context,
                              applicationIcon: const FlutterLogo(),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  body: buildBody(context, snapshot),
                  drawer: const NavigationDrawer(
                    elevation: 5,
                    // tilePadding: EdgeInsets.symmetric(vertical: 20),
                    children: [
                      AccountHeader(),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.settings_sharp),
                        label: Text("Preferences"),
                      ),
                      // accountButton,
                      // preferencesButton,
                    ],
                  ),
                );
              }),
        ));
  }
}
