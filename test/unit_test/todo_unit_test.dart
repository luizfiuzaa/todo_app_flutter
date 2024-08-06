import 'package:asp/asp.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/interactor/atoms/todo_atom.dart';
import 'package:todo_app/src/modules/adapter/todo_adapter.dart';

class TodoAtomMock extends Mock implements TodoAtom {}

class TodoItemMock extends Mock implements TodoItem {}

void main() {
  final todoAtom = TodoAtomMock();
  WidgetsFlutterBinding.ensureInitialized();
  setUp(
    () {
       when(() => todoAtom.todoListAll).thenReturn(Atom<List<TodoItemMock>>([]));
    },
  );

  tearDownAll(
    () {},
  );

  test('Get no results from the Box', () async {
    expect(todoAtom.todoListAll, Atom<List<TodoItemMock>>([]));
  });
}
