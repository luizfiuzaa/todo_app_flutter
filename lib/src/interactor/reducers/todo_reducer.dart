import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/adapter/todo_adapter.dart';
import 'package:todo_app/src/modules/boxes/todo_box.dart';
import 'package:todo_app/src/interactor/atoms/todo_atom.dart';

class TodoReducer extends Reducer {
  final TodoAtom todoAtom = Modular.get<TodoAtom>();

  TodoReducer() {
    on(() => [todoAtom.saveTodoAction], () async {
      if (todoAtom.todoTitle.value.isEmpty) {
        todoAtom.todoTitle.value = "Make a ToDo Task";
      }
      await todoBox.add(
        TodoItem(
          title: todoAtom.todoTitle.value,
          isCompleted: false,
        ),
      );
    });

    on(() => [todoAtom.todoListAll], () async {
      todoAtom.todoListAll.setValueWithoutReaction(todoBox.values.toList());
    });

    on(() => [todoAtom.deleteAllTodoAction], () async {
      if (todoBox.values.isNotEmpty) {
        await todoBox.clear();
        todoAtom.todoListAll.setValue(todoBox.values.toList());
      }
        Modular.to.pop();
    });
    on(() => [todoAtom.deleteTodoAction], () async {
      await todoBox.deleteAt(todoAtom.deleteTodoAction.value);
    });

    void dispose() {}
  }
}
