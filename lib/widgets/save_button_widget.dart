import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/interactor/atoms/todo_atom.dart';

class SaveButtonWidget extends StatefulWidget {

  final todoAtom = Modular.get<TodoAtom>();

   SaveButtonWidget({super.key});

  @override
  State<SaveButtonWidget> createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(13), child: ElevatedButton(onPressed: () {
     widget.todoAtom.saveTodoAction();
    }, child: const Icon(Icons.add)),);
  }
}