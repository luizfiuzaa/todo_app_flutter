import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/interactor/atoms/todo_atom.dart';
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
      key: const Key('homePage'),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        key: const Key('appBar'),
        title: const Text("To Do"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const DrawerWidget(
        key: Key('drawerBtn'),
      ),
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
          SaveButtonWidget(
            key: const Key('todoSaveBtn'),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
