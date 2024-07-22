import 'package:asp/asp.dart';
import 'package:todo_app/interactor/states/todo_state.dart';

class TodoAtom /*implements Disposable*/ {
  final showTodoAction = Atom.action();
  final saveTodoAction = Atom.action();

  final todoTitle = Atom<String>('');
}


