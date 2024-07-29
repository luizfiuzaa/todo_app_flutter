import 'package:asp/asp.dart';
import 'package:todo_app/src/modules/adapter/todo_adapter.dart';

class TodoAtom /*implements Disposable*/ {
  final showTodoAction = Atom.action();
  
  final saveTodoAction = Atom.action();
  final helpAiTodoAction = Atom<int>(-1);


  final deleteTodoAction = Atom<int>(-1);
  final deleteAllTodoAction = Atom.action();

  final todoTitle = Atom<String>('');
  final todoListAll = Atom<List<TodoItem>>([]);

  void dispose(){}

}


