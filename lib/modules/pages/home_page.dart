import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/boxes/todo_box.dart';
import 'package:todo_app/modules/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/widgets/drawer_widget.dart';
import 'package:todo_app/src/widgets/list_todo_widget.dart';
import 'package:todo_app/src/widgets/save_button_widget.dart';
import 'package:todo_app/src/widgets/text_field_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final todoAtom = Modular.get<TodoAtom>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("To Do"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          const Expanded(child: ListTodoWidget()),
          TextFieldWidget(
            hintText: "Type something...",
            controller: controller,
            onChanged: (v) {
              todoAtom.saveTodoAction;
            },
          ),
          SaveButtonWidget(onPressed: () {
            todoAtom.todoTitle.setValue(controller.text);
            todoAtom.saveTodoAction();
            todoAtom.todoListAll.setValue(todoBox.values.toList());
            controller.clear();
          }),
        ],
      ),
    );
  }
}
