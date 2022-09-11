import 'dart:async';

import 'package:code_repository/views/home/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

StreamController<Widget> bodyController = StreamController<Widget>.broadcast();

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<StatefulWidget> createState() => BodyState();
}

class BodyState extends State<Body> {
  late StreamSubscription<User?> userChangeSubscription;

  void handleUserChange(User? user) {
    if (user == null) {
      bodyController.sink.add(const HomeView());
    }
  }

  @override
  void initState() {
    super.initState();

    userChangeSubscription =
        FirebaseAuth.instance.userChanges().listen(handleUserChange);
  }

  @override
  void dispose() {
    userChangeSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bodyController.stream,
      builder: (context, AsyncSnapshot<Widget> snapshot) {
        return snapshot.data ?? const HomeView();
      },
    );
  }
}
