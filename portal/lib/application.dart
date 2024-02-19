import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portal/auth/account.dart';
import 'package:portal/bundle.dart';
import 'package:portal/configure.dart';
import 'package:portal/theme/dark.dart';
import 'package:portal/theme/light.dart';
import 'package:portal/theme/toggle.dart';

class Application extends StatefulWidget {
  final String title;

  const Application({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  String? pageTitle;
  ThemeMode themeMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

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
    const themeToggle = ThemeToggle();

    const drawer = NavigationDrawer(
      elevation: 5,
      tilePadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: [
        AccountHeader(),
        NavigationDrawerDestination(icon: Icon(Icons.code), label: Text("Code")),
        Divider(),
        NavigationDrawerDestination(icon: Icon(Icons.settings_sharp), label: Text("Preferences")),
        themeToggle,
      ],
    );

    final app = ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: builder,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.title,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeToggle.themeMode,
      home: DefaultAssetBundle(
        bundle: DefaultBundle(),
        child: FutureBuilder(
          future: deferredConfigure(context),
          builder: (context, snapshot) => Scaffold(
            primary: true,
            body: buildBody(context, snapshot),
            drawer: drawer,
            appBar: AppBar(
              primary: true,
              title: Text(pageTitle ?? ""),
              actions: [
                MenuAnchor(
                  builder: (context, controller, child) => IconButton(
                    onPressed: controller.isOpen ? controller.close : controller.open,
                    icon: const Icon(Icons.more_vert_sharp),
                  ),
                  menuChildren: [
                    MenuItemButton(
                        child: const Text("About"),
                        onPressed: () =>
                            showAboutDialog(context: context, applicationIcon: const FlutterLogo()))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
