import 'package:flutter/material.dart';

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
