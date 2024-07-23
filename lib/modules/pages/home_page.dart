import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/interactor/atoms/todo_atom.dart';
import 'package:todo_app/widgets/drawer_widget.dart';
import 'package:todo_app/widgets/list_todo_widget.dart';
import 'package:todo_app/widgets/save_button_widget.dart';
import 'package:todo_app/widgets/text_field_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final todoAtom = Modular.get<TodoAtom>();
  final TextEditingController _textEditingController = TextEditingController();

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
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const ListTodoWidget()),
          TextFieldWidget(
            hintText: "Type something...",
            controller: _textEditingController,
            onChanged: (v) {
              todoAtom.saveTodoAction;
            },
          ),
          SaveButtonWidget(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
