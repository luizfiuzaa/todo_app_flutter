import 'package:flutter/material.dart';
import 'package:todo_app/modules/adapter/todo_adapter.dart';
import 'package:todo_app/modules/boxes/todo_box.dart';
import 'package:todo_app/widgets/todo_card_widget.dart';

class ListTodoWidget extends StatefulWidget {
  const ListTodoWidget({super.key});

  @override
  State<ListTodoWidget> createState() => _ListTodoWidgetState();
}

class _ListTodoWidgetState extends State<ListTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoBox.length,
      itemBuilder: (context, index) {
        TodoItem todoItem = todoBox.getAt(index);
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Expanded(
            child: ToDoCardWidget(
              todoTitle: "#${index.toString()} - ${todoItem.title}",
              onPressed: () {
                todoBox.deleteAt(index);
              },
            ),
          ),
        );
      },
    );
  }
}
