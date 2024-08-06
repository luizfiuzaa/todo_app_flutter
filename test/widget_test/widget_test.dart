import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart' as app;



void main() {
  testWidgets('Textfield test', (WidgetTester tester) async {
    app.main();
  await tester.pumpAndSettle();
    final textField = find.byKey(const Key('todoTitleInput'));
    expect(textField, findsOneWidget);
    await tester.tap(textField);
    await tester.enterText(textField, 'Freeman');
    expect(textField, equals('Freeman'));
  });
}
