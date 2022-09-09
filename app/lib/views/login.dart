import 'package:flutter/material.dart';

import 'actions.dart' as app_actions;

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  LoginWidgetState createState() {
    return LoginWidgetState();
  }
}

class LoginWidgetState extends State<LoginWidget> {
  final loginKey = GlobalKey<FormState>();
  late FocusNode loginInput;

  @override
  void initState() {
    super.initState();

    loginInput = FocusNode();
  }

  @override
  void dispose() {
    loginInput.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginKey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            LoginSubmit(loginKey: loginKey, loginInput: loginInput),
        body: Center(
          child: LoginTextEntry(focusNode: loginInput),
        ),
      ),
    );
  }
}

class LoginTextEntry extends StatelessWidget {
  const LoginTextEntry({super.key, required this.focusNode});
  static RegExp validEmail = RegExp(r'.+@.+\..+');
  final FocusNode focusNode;

  String? validate(String? value) {
    if (value == null) {
      return 'Please enter some text';
    } else if (!validEmail.hasMatch(value)) {
      return 'Please enter a valid e-mail address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'Enter valid email id as abc@host.com',
      ),
      autofocus: true,
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
    );
  }
}

class LoginSubmit extends StatelessWidget {
  const LoginSubmit(
      {super.key,
      this.duration = 250,
      required this.loginKey,
      required this.loginInput});

  final GlobalKey<FormState> loginKey;
  final FocusNode loginInput;
  final int duration;

  void handlePress(BuildContext context) {
    if (loginKey.currentState!.validate()) {
      // Navigate to the Actions page/view
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Submitted!'),
          duration: Duration(milliseconds: duration),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const app_actions.Actions(),
        ),
      );
    } else {
      loginInput.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.all(20.0),
          shape: const StadiumBorder(),
        ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0),
        ),
        onPressed: () => handlePress(context),
        child: const Text('Submit'));
  }
}
