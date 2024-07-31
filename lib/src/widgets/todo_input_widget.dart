import 'package:flutter/material.dart';

class TodoInputWidget extends StatelessWidget {
  const TodoInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children: [
          TextField(
            key: const Key('todoTitleInput'),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
