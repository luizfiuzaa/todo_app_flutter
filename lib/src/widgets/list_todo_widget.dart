import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/adapter/todo_adapter.dart';
import 'package:todo_app/src/modules/boxes/todo_box.dart';
import 'package:todo_app/src/modules/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/widgets/todo_card_widget.dart';

class ListTodoWidget extends StatefulWidget {
  const ListTodoWidget({super.key});
  @override
  State<ListTodoWidget> createState() => _ListTodoWidgetState();
}

class _ListTodoWidgetState extends State<ListTodoWidget> {
  final TodoAtom todoAtom = Modular.get<TodoAtom>();
  @override
  void initState() {
    todoAtom.todoListAll.setValue(todoBox.values.toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoList = context.select(() => todoAtom.todoListAll.value);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          TodoItem todoItem = todoList[index];
          return ToDoCardWidget(
            todoTitle: todoItem.title,
            index: index,
          );
        },
      ),
    );
  }
}
