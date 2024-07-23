import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/boxes/todo_box.dart';
import 'package:todo_app/modules/interactor/atoms/todo_atom.dart';

class ToDoCardWidget extends StatelessWidget {
  ToDoCardWidget({super.key, required this.todoTitle, required this.onPressed});
  final String todoTitle;
  final void Function()? onPressed;

  final todoAtom = Modular.get<TodoAtom>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CheckBoxWidget(),
      title: Text(
        todoTitle,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Row(
        children: [
          IconButton(
            color: Colors.red,
            onPressed: onPressed,
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: onPressed,
            icon: const Icon(Icons.edit),
          ),
        ],
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
