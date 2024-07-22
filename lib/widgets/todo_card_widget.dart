import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/adapter/todo_adapter.dart';

class ToDoCardWidget extends StatelessWidget {
  const ToDoCardWidget({super.key, required this.todoTitle});
  final String todoTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: CheckBoxWidget(),
                  title: Text(
                    todoTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Row(
                    children: [
                      IconButton(
                        color: Colors.red,
                        onPressed: () {
                          null;
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () {
                          null;
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  final a = Atom<bool>(false);
  CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final b = context.select(() => widget.a);

    return Checkbox(
        value: b.value,
        onChanged: (v) {
          b.setValue(v!);
        });
  }
}
