// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/adapter/todo_adapter.dart';
import 'package:todo_app/interactor/atoms/todo_atom.dart';
import 'package:todo_app/widgets/drawer_widget.dart';
import 'package:todo_app/widgets/save_button_widget.dart';
import 'package:todo_app/widgets/text_field_widget.dart';
import 'package:todo_app/widgets/todo_card_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoAtom todoAtom = Modular.get<TodoAtom>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("To do"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          ToDoCardWidget(
            todoTitle: "Teste",
          ),
          TextFieldWidget(
            hintText: "Type something",
            controller: _textEditingController,
            onChanged: (v) {
              // todoAtom.
            },
          ),
          SaveButtonWidget()
        ],
      ),
    );
  }
}
