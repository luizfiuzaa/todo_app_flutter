import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/src/modules/adapter/todo_adapter.dart';
import 'package:todo_app/src/modules/boxes/todo_box.dart';
import 'package:todo_app/src/modules/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/services/api_service.dart';

class TodoReducer extends Reducer {
  final TodoAtom todoAtom = Modular.get<TodoAtom>();
  final ApiService _apiService = ApiService();

  TodoReducer() {
    on(() => [todoAtom.saveTodoAction], () async {
      if (todoAtom.todoTitle.value.isNotEmpty) {
        await todoBox.add(
          TodoItem(
            title: todoAtom.todoTitle.value,
            isCompleted: false,
          ),
        );
      }
    });

    on(() => [todoAtom.todoListAll], () async {
      todoAtom.todoListAll.setValueWithoutReaction(todoBox.values.toList());
    });

    on(() => [todoAtom.helpAiTodoAction], () async {
      final todo = todoAtom.todoListAll.value[todoAtom.helpAiTodoAction.value];
      todo.title.toString();
    });

    on(() => [todoAtom.deleteTodoAction], () async {
      await todoBox.deleteAt(todoAtom.deleteTodoAction.value);
    });
    on(() => [todoAtom.deleteAllTodoAction], () async {
      if (todoBox.values.isNotEmpty) {
        await todoBox.clear();
        todoAtom.todoListAll.setValue(todoBox.values.toList());
      }
    });
    on(() => [todoAtom.helpAiTodoAction], () async {
      final int index = todoAtom.helpAiTodoAction.value;
      final todo = todoAtom.todoListAll.value[index];
      final String prompt =
          'Cite somente em tópicos resumidos como posso fazer a seguinte atividade: ${todo.title}';
      log(prompt);
      final response = await _apiService.getChatGptResponse(prompt);
      todoAtom.aiResult.setValue(response.toString());
      log(response);
    });

    void dispose() {}
  }
}
