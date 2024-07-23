import 'package:asp/asp.dart';

class TodoAtom /*implements Disposable*/ {
  final showTodoAction = Atom.action();
  final saveTodoAction = Atom.action();
  final deleteTodoAction = Atom.action();

  final todoTitle = Atom<String>('');

  void dispose(){}

}


