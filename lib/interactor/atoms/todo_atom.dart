import 'package:asp/asp.dart';

class ToDoAtom {
  final todoState = Atom(false);
  final checkAction = Atom.action();
}
