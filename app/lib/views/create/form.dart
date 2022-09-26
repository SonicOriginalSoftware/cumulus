import 'package:flutter/material.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  final formKey = GlobalKey<FormState>();
  static double mainAxisSpacing = 24.0;
  static double crossAxisSpacing = 0.0;

  void validate() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    final fields = Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceAround,
      spacing: mainAxisSpacing,
      runSpacing: crossAxisSpacing,
      children: [
        FractionallySizedBox(
          widthFactor: 0.4,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Name of the repository',
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.4,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Description of the repository',
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.5,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Path',
              hintText: 'Path of the repository',
            ),
          ),
        ),
      ],
    );

    final submitButton = ElevatedButton(
      onPressed: validate,
      child: const Text("Save"),
    );

    return Form(
      child: Column(
        children: [
          fields,
          const Divider(
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          submitButton,
        ],
      ),
    );
  }
}
