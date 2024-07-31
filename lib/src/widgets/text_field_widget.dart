import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
  });

  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('todoTitleInput'),
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        fillColor: Theme.of(context).colorScheme.inversePrimary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
