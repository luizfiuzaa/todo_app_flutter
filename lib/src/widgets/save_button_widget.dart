import 'package:flutter/material.dart';
import 'package:todo_app/src/modules/boxes/todo_box.dart';
import 'package:todo_app/src/widgets/todo_card_widget.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          controller;
          todoAtom.todoTitle.setValue(controller.text);
          todoAtom.saveTodoAction();
          todoAtom.todoListAll.setValue(todoBox.values.toList());
          controller.clear();
        },
        child: const Icon(Icons.add));
  }
}
