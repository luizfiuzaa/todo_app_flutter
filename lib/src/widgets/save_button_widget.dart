import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: onPressed,
      ),
    );
  }
}
