import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/interactor/atoms/todo_atom.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key, required this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: const Icon(Icons.add));
  }
}
