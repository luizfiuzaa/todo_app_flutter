import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/adapter/todo_adapter.dart';
import 'package:todo_app/modules/boxes/todo_box.dart';
import 'package:todo_app/modules/interactor/atoms/todo_atom.dart';

class TodoReducer extends Reducer {
  final TodoAtom todoAtom = Modular.get<TodoAtom>();

  TodoReducer() {
    on(() => [todoAtom.saveTodoAction], () {
      todoBox
          .add(TodoItem(title: todoAtom.todoTitle.value, isCompleted: false,));
    });

    void dispose() {}
  }
}
