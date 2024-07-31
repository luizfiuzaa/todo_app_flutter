import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home Page E2E Test', () {
    testWidgets(
      'Escrever um texto no input',
      (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();
        var title = find
            .byKey(const Key('todoTitleInput'))
            .evaluate()
            .single
            .widget as Text;
        expect(title.data, equals(null));

        await tester.enterText(find.byKey(const Key('todoTitleInput')), 'Houdini',);

        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 2));
        title = find.byKey(const Key('todoTitleInput')).evaluate().single.widget as Text;
        expect(title.data, equals("Houdini"));
      },
    );
  });
}
