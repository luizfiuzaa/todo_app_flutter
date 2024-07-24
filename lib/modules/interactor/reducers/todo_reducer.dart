import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/adapter/todo_adapter.dart';
import 'package:todo_app/modules/boxes/todo_box.dart';
import 'package:todo_app/modules/interactor/atoms/todo_atom.dart';

class TodoReducer extends Reducer {
  final TodoAtom todoAtom = Modular.get<TodoAtom>();

  TodoReducer() {
    on(() => [todoAtom.saveTodoAction], () async {
      await todoBox.add(
        
        TodoItem(
          title: todoAtom.todoTitle.value,
          isCompleted: false,
        ),
      );
      todoAtom.todoListAll.setValue(todoBox.values.toList());
    });

    on(() => [todoAtom.todoListAll], () {
      todoAtom.todoListAll.setValue(todoBox.values.toList());
    });
    on(() => [todoAtom.deleteAllTodoAction], () async {
      if (todoBox.values.isNotEmpty) {
        await todoBox.clear();
        todoAtom.todoListAll.setValue(todoBox.values.toList());
      }
      todoAtom.todoListAll.setValue(todoBox.values.toList());
    });
    on(() => [todoAtom.deleteTodoAction], () async {
      await todoBox.deleteAt(todoAtom.deleteTodoAction.value);
      todoAtom.todoListAll.setValue(todoBox.values.toList());
    });

    void dispose() {}
  }
}
