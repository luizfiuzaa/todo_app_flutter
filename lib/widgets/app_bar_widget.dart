import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("To do"),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
