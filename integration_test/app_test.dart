import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart' as app;
import 'package:todo_app/src/widgets/drawer_widget.dart';
import 'package:todo_app/src/widgets/todo_card_widget.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Home Page dummys ToDo', () {
    testWidgets('Click 3x on add ToDo', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('todoSaveBtn')));
        await Future.delayed(const Duration(seconds: 1));
      }
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('todoCard')).at(0), findsOneWidget);
      expect(find.byKey(const Key('todoCard')).at(1), findsOneWidget);
      expect(find.byKey(const Key('todoCard')).at(2), findsOneWidget);
    });
    testWidgets('Create a personalizated ToDo', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      var title = find
          .byKey(const Key('todoTitleInput'))
          .evaluate()
          .single
          .widget as Text;
      expect(title.data, eu);

      await tester.tap(find.byKey(const Key('todoSaveBtn')));
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('todoCard')).at(0), findsOneWidget);
      expect(find.byKey(const Key('todoCard')).at(1), findsOneWidget);
      expect(find.byKey(const Key('todoCard')).at(2), findsOneWidget);
    });
  });

  group('Home Page delete dummys ToDo', () {
    testWidgets('Create a ToDo dummy and delete', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('todoSaveBtn')));
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('todoCard')), findsOneWidget);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));

      await tester.tap(find.byKey(const Key('deleteTodo')));
      await tester.pumpAndSettle();
      expect(
          find.byWidget(
              const ToDoCardWidget(todoTitle: 'Make a ToDo Task', index: 0)),
          findsNothing);
    });
  });

  testWidgets('Click on Drawer and clear all Data',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.byWidget(const Drawer()), findsAtLeast(1));
    await tester.pumpAndSettle();
    // await Future.delayed(const Duration(seconds: 1));
    // await tester.tap(find.byKey(const Key('deleteAllTodo')));
    // await tester.pumpAndSettle();

    // expect(find.byKey(const Key('todoCard')), findsNothing);
  });
}
