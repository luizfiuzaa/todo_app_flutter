import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Home Page ToDo', () {
    testWidgets('Click 3x on add and delete ToDo', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todoSaveBtn')), findsOneWidget);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('todoSaveBtn')));
      }
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('todoCard')), findsAtLeastNWidgets(3));

      expect(find.byKey(const Key('deleteTodo')), findsAtLeast(3));
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('deleteTodo')).at(0));
      }
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('todoCard')), findsNothing);
    });
  });

  group('Home Page create custom ToDo', () {
    testWidgets('Create a custom ToDo and delete', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todoTitleInput')), findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('todoTitleInput')), 'Houdini');
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todoSaveBtn')), findsOneWidget);
      await tester.tap(find.byKey(const Key('todoSaveBtn')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('todoCard')), findsOneWidget);

      expect(find.byKey(const Key('deleteTodo')), findsOne);
      await tester.tap(find.byKey(const Key('deleteTodo')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todoCard')), findsNothing);
    });
  });

  group('Home Page Todo Delete All function', () {
    testWidgets('Create 3 dummy ToDo, click on Drawer and click on Clear Data',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todoSaveBtn')), findsOneWidget);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('todoSaveBtn')));
        await tester.pumpAndSettle();
      }
      expect(find.byKey(const Key('todoCard')), findsWidgets);

      expect(find.byTooltip('Open navigation menu'), findsOneWidget);
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      expect(find.text('CLEAR DATA'), findsOne);
      await tester.tap(find.text('CLEAR DATA'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todoCard')), findsNothing);
    });
  });
}
