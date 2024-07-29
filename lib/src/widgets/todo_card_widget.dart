import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/boxes/todo_box.dart';
import 'package:todo_app/src/modules/interactor/atoms/todo_atom.dart';

final todoAtom = Modular.get<TodoAtom>();

class ToDoCardWidget extends StatelessWidget {
  const ToDoCardWidget(
      {super.key, required this.todoTitle, required this.index});
  final int index;
  final String todoTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: CheckBoxWidget(),
            title: Text(
              todoTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Row(
              children: [
                IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoAtom.deleteTodoAction.setValue(index);
                    todoAtom.todoListAll.setValue(todoBox.values.toList());
                  },
                ),
                IconButton(
                  color: Colors.lightBlue,
                  icon: const Icon(Icons.auto_awesome_rounded),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
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
      },
    );
  }
}
